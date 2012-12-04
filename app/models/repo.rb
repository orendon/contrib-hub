class Repo < ActiveRecord::Base
  attr_accessible :github_url, :name, :need_help,
    :user_id, :user_description, :tag_list

  ## tagging
  acts_as_taggable

  ## relations
  belongs_to :user

  ## validations
  validates :github_url, :github_id, :name, :user, :presence => true

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
        repos = Github::Repos.new
        reps = repos.all user: user.github_id
        r = reps.find { |x| x.full_name == name }
        Rails.logger.info r.inspect
        if r
          %w(name github_url need_help created_at updated_at full_name description
            language forks watchers open_issues pushed_at).each do |attr|
            repo.send("#{attr}=", r.send(attr.to_sym))
          end
          repo.github_id = r.id
          repo.github_url = r.html_url
          repo.user_id = user.id
        end
        repo.need_help = true
      else
        repo.need_help = !repo.need_help if toggle
      end
      repo.save if repo.name
      repo
    end

    def create_or_update(user, params)
      repo = Repo.find_or_initialize_by_github_id(params[:id])
      %w(name github_url need_help created_at updated_at full_name description language
        forks watchers open_issues pushed_at).each do |attr|
        repo.send("#{attr}=", params[attr.to_sym])
      end
      repo.github_id = params[:id]
      repo.user_id = user.id
      repo.need_help = !repo.need_help unless repo.new_record?
      repo.save
    end

    def get_languages
      languages_list = select(:language).uniq
      languages_list.collect(&:language).reject { |l| l.nil? || l.empty? }
    end

    def current_tags_for(repo_full_name, user_id)
      repo = Repo.find_by_full_name_and_user_id(repo_full_name, user_id)
      tag_list = repo.nil? ? [] : repo.tag_list
    end

    def fetch_all_tag_names
      tags = ActiveRecord::Base.connection.execute("SELECT name FROM tags")
      tags.map { |tag| tag["name"] }
    end

    def get_needing_help_counter_for(current_user)
      where("need_help = ? and user_id= ?", true, current_user)
    end

  end

end
