require "github_api"

class UsersController < ApplicationController
  include Utils

  def show
    saved_repos = current_user.repos
    @own_repos = merge_github_repos(current_user, saved_repos.to_a)
    @repos_needing_help = current_user.need_help_counter
    gon.tags = get_all_tag_names
  end

  private

  def merge_github_repos(user, user_repos)
    github_repos = get_github_repos_for(user)
    github_repos.each do |repo|
      user_repos << repo unless existing_repo?(user_repos, repo)
    end
    user_repos
  end

  def get_github_repos_for(user)
    repos = Github::Repos.new
    repos.all user: user.github_id
  end

  def existing_repo?(existing_repos, repo)
    existing_repos.select {|r| r[:github_id] == repo.id }.any?
  end
end
