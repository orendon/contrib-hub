class Repo < ActiveRecord::Base
  include RepoPresenter

  attr_accessible :github_url, :name, :need_help, :user_id, :user_description,
    :github_url, :full_name, :description, :language, :forks, :watchers,
    :open_issues, :pushed_at, :tag_list, :last_sync

  ## tagging
  acts_as_taggable

  ## relations
  belongs_to :user

  ## validations
  validates :github_url, :github_id, :name, :user, :presence => true
  validates :github_id, :uniqueness => true

  ## instance methods

  def is_being_helped_by?(user)
    helped_repo = user.helped_repos.find_by_repo_id(self.id)
    helped_repo.nil? ? false : true
  end

  ## class methods

  class << self

    def init_and_toggle_repo(user, name)
      repo = init_repo(user, name, true)
      repo
    end

    def init_and_description(user, name, description)
      repo = init_repo(user, name)
      repo.user_description = description
      repo.save
      repo
    end

    def init_repo(user, name, toggle=false)
      repo = self.find_or_initialize_by_full_name(name)

      if repo.new_record?
        github_repo = GithubUtils.get_repo_details(user, name)
        if github_repo
          repo_attributes.each do |attr|
            repo.send("#{attr}=", github_repo.send(attr.to_sym))
          end
          repo.github_id = github_repo.id
          repo.github_url = github_repo.html_url
          repo.user_id = user.id
        end
        repo.need_help = true
      else
        repo.need_help = !repo.need_help if toggle
      end
      repo.last_sync = Time.now
      repo.save
      repo
    end

    def create_or_update(user, params)
      repo = Repo.find_or_initialize_by_github_id(params[:id])
      repo_attributes.each do |attr|
        repo.send("#{attr}=", params[attr.to_sym])
      end
      repo.github_id = params[:id]
      repo.user_id = user.id
      repo.need_help = !repo.need_help unless repo.new_record?
      repo.save
    end

  end
  
  private
  
  def repo_attributes
    %w(name github_url need_help created_at updated_at full_name description language forks watchers open_issues pushed_at)
  end

end
