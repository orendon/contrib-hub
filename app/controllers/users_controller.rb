require "github_api"

class UsersController < ApplicationController
  include Utils

  def show
    saved_repos = current_user.repos
    @own_repos = merge_github_repos(current_user, saved_repos.to_a)
    @repos_needing_help = current_user.need_help_counter
  end

  def update
    current_user.location = params["location"]
    current_user.save!
    redirect_to user_path(current_user)
  end

  private

  def merge_github_repos(user, user_repos)
    github_repos = GithubUtils.get_repos_list_for(user)
    github_repos.each do |repo|
      user_repos << repo unless existing_repo?(user_repos, repo)
    end
    user_repos
  end

  def existing_repo?(existing_repos, repo)
    existing_repos.select {|r| r[:github_id] == repo.id }.any?
  end
end
