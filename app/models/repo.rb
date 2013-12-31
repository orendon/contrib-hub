class Repo < ActiveRecord::Base
  include RepoPresenter

  attr_accessible :github_url, :name, :need_help, :user_id, :user_description,
    :github_id, :full_name, :description, :language, :forks, :watchers,
    :open_issues, :pushed_at, :tag_list, :last_sync, :fork

  ## tagging
  acts_as_taggable

  ## default "per_page" value
  self.per_page = 12

  ## relations
  belongs_to :user

  ## validations
  validates :github_url, :github_id, :name, :user, :presence => true
  validates :github_id, :uniqueness => true

  scope :help_wanted_repos, -> { includes(:user).where(need_help: true) }
  scope :except_from, ->(user_id){ where("user_id != ?", user_id) }

  ## instance methods

  def is_being_helped_by?(user)
    helped_repo = user.helped_repos.find_by_repo_id(self.id)
    helped_repo.nil? ? false : true
  end

  def toggle_need_help!
    update_attribute(:need_help, !need_help)
  end

  #search

  def self.search(search)
    if search
      where('full_name like :sSearch or language like :sSearch', sSearch: "%#{search}%")
    else
      scoped
    end
  end

  ## class methods

  class << self
    def get_featured_repos(counter)
      help_wanted_repos.order("RANDOM()").limit(counter)
    end

    def extract_info(github_repo)
      {
        :name => github_repo['name'],
        :github_url => github_repo['html_url'],
        :full_name => github_repo['full_name'],
        :description => github_repo['description'],
        :language => github_repo['language'],
        :forks => github_repo['forks'],
        :watchers => github_repo['watchers'],
        :open_issues => github_repo['open_issues'],
        :pushed_at => github_repo['pushed_at'],
        :github_id => github_repo['id'],
        :fork => github_repo['fork']
      }
    end
  end
end
