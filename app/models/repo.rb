class Repo < ActiveRecord::Base
  attr_accessible :github_url, :name, :need_help, :user_id

  belongs_to :user

  class << self
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
