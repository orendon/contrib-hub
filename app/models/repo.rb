class Repo < ActiveRecord::Base
  attr_accessible :github_url, :name, :need_help, :user_id, :user_description

  belongs_to :user

  validates :github_url, :name, :user, :presence => true

  class << self

    def init_and_toggle_repo(user, name)
      repo = init_repo(user,name, true)
      repo
    end

    def init_and_description(user, name, description)
      repo = init_repo(user,name)
      repo.user_description = description
      repo.save
      repo
    end

    def init_repo(user, name, toggle=false)
      repo = self.find_or_initialize_by_full_name(name)
      if repo.new_record?
        repos = Github::Repos.new
        reps = repos.all user: user.github_id
        r = reps.find{|x| x.full_name == name}
        Rails.logger.info r.inspect
        if r
          %w(name github_url need_help created_at updated_at full_name description language forks watchers open_issues pushed_at).each do |attr|
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
      %w(name github_url need_help created_at updated_at full_name description language forks watchers open_issues pushed_at).each do |attr|
        repo.send("#{attr}=", params[attr.to_sym])
      end
      repo.github_id = params[:id]
      repo.user_id = user.id
      repo.need_help = !repo.need_help unless repo.new_record?
      repo.save
    end

    def get_languages
      languages_list = select(:language).uniq
      languages_list.collect(&:language)
    end
  end

  def is_being_helped_by(user)
    helped_repo = HelpedRepos.find_by_user_id_and_repo_id(user.id, self.id)
    helped_repo.nil? ? false : true
  end

end
