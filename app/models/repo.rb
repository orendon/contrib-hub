class Repo < ActiveRecord::Base
  attr_accessible :github_url, :name, :need_help, :user_id

  belongs_to :user

  def is_being_helped_by(user)
    helped_repo = HelpedRepos.find_by_user_id_and_repo_id(user.id, self.id)
    helped_repo.nil? ? false : true
  end

  def self.get_repos_form_others(user)
    where("user_id <> ?", user.id).all
  end
end
