class User < ActiveRecord::Base
  extend FriendlyId
  include UserPresenter

  attr_accessible :github_id, :name, :token, :location, :latitude, :longitude, :email,
    :avatar_url, :github_url, :public_repos, :public_gists, :followers, :following, :last_sync

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

  ## instance methods
  def update_repo_status(repo)
    if repo.is_being_helped_by?(self)
      HelpedRepo.find_by_user_id_and_repo_id(self.id, repo.id).destroy
    else
      HelpedRepo.create!(user_id: self.id, repo_id: repo.id, really_helping: false)
    end
  end

  def sync_github_data
    user_data = GithubUtils.get_user_details_for(self)
    self.update_attributes!(user_data)

    github_repos = GithubUtils.get_repos_list_for(self)
    self.repos.each do |repo|
      matched_repo = github_repos.find { |x| x.full_name == repo.full_name }
      if matched_repo
        repo_data = GithubUtils.normalize_repo(matched_repo)
        repo.update_attributes!(repo_data)
      end
    end
  end

  ## class methods

  class << self

    def find_or_create_from(auth_hash)
      user_data = OmniauthUtils.normalize_hash(auth_hash)
      user_data[:last_sync] = Time.now
            
      user = find_by_github_id(user_data[:github_id])
      if user
        user.update_attributes!(user_data)
      else
        user = User.create!(user_data)
      end

      github_repos = GithubUtils.get_repos_list_for(user)
      github_repos.each do |remote_repo|
        data = Repo.extract_info(remote_repo)
        user.repos.create(data)
      end
      
      user
    end

  end
end
