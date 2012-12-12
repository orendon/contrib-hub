require "github_api"

class UsersController < ApplicationController
  include Utils

  def show
    @user = github_data_for(current_user)
    @own_repos = github_repos_for(current_user)
    @own_repos = set_help_status(@own_repos)
    @repos_helping = current_user.helped_repos
    @repos_needing_help = current_user.need_help_counter
    gon.tags = get_all_tag_names
  end

  private
    def github_data_for(user)
      github = Github.new oauth_token: user.token
      github.users
    end

    def github_repos_for(user)
      repos = Github::Repos.new
      repos = repos.all user: user.github_id

      orgs = Github.orgs.all(user: user.github_id).collect { |o| o.login }
      orgs.each do |o|
        repos += Github.repos.all(user: o)
      end

      repos
    end

    def set_help_status(repos)
      repos.each do |repo|
        repo[:need_help] = get_status(repo[:id])
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
