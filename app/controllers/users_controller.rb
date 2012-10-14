require "github_api"
class UsersController < ApplicationController

  def show
    @user = get_info_for(current_user)
    @user_repos = get_repos_list(current_user)
    @user_repos = add_status(@user_repos)
    @user_helping = HelpedRepos.find_all_by_user_id(current_user.id)
    @user_need_help = Repo.find_all_by_user_id_and_need_help(current_user.id, true)
  end

  private
    def get_info_for(user)
      github = Github.new oauth_token: user.token
      @user = github.users
    end

    def get_repos_list(user)
      repos = Github::Repos.new
      repos.all user: user.github_id
    end

    def add_status(repos)
      repos.each do |repo|
        repo[:status] = get_status(repo[:id])
        repo[:user_description] = get_description(repo[:id])
      end
      repos
    end

    def get_status(github_id)
      repo = Repo.find_by_github_id(github_id)
      return repo.need_help if repo
      false
    end

    def get_description(github_id)
      repo = Repo.find_by_github_id(github_id)
      return repo.user_description if repo
      false
    end
end
