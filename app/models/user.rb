class User < ActiveRecord::Base
  extend FriendlyId
  include UserPresenter

  ## friendly url
  friendly_id :github_id, use: :slugged

  ## relations
  has_many :repos
  has_many :helped_repos

  ## geolocation
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  ## validations
  validates :github_id, :token, :presence => true
  validates :github_id, :uniqueness => true

  scope :recent, -> { where("updated_at > ?", 3.months.ago)  }

  ## instance methods
  def update_repo_status(repo)
    if repo.is_being_helped_by?(self)
      HelpedRepo.find_by_user_id_and_repo_id(self.id, repo.id).destroy
    else
      HelpedRepo.create!(user_id: self.id, repo_id: repo.id,
        really_helping: false)
    end
  end

  def sync_github_data
    sync_github_user
    sync_github_repos
  end

  def sync_github_user
    user_data = GithubUtils.get_user_details_for(self)
    self.update_attributes!(user_data)
  end

  def sync_github_repos
    github_repos = GithubUtils.get_repos_list_for(self)
    sync_repos = github_repos.map(&:id)
    user_repos = self.repos.map(&:github_id)
    remove_deleted_repos(user_repos, sync_repos)
    sync_repos(github_repos)
  end

  private

  def remove_deleted_repos(user_repos, sync_repos)
    removed_repos = user_repos - sync_repos
    self.repos.where(github_id: removed_repos).delete if removed_repos.any?
  end

  def sync_repos(github_repos)
    github_repos.each do |repo|
      matched_repo = self.repos.find_by_github_id repo.id
      if matched_repo
        repo_data = GithubUtils.normalize_repo(repo)
        matched_repo.update_attributes!(repo_data)
      else
        repo_data = Repo.github_params repo
        self.repos.create(repo_data)
      end
    end
  end

  ## class methods

  class << self

    def find_or_create_from(auth_hash)
      user_data = OmniauthUtils.normalize_hash(auth_hash)
      user_data[:last_sync] = Time.now
      omni_data = omni_params(user_data)
      user = find_by_github_id(user_data[:github_id])
      if user
        user.update_attributes!(omni_data)
      else
        user = User.create!(omni_data)
      end

      SyncUserWorker.perform_async(user.id)

      user
    end

    def get_users_needing_help
      self.joins(:repos).where("repos.need_help=?", true)
    end

private
    def omni_params(user_data)
      user_data = ActionController::Parameters.new(user_data)
      user_data.permit(:github_id, :token, :name, :email, :location, :avatar_url, :github_url,
                       :public_repos, :public_gists, :followers, :following, :last_sync)
    end

  end

end
