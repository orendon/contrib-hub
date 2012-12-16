class ReposController < ApplicationController
  
  def show
    repo = Repo.find_by_name(params['project_name'])
    user = User.find(repo.user_id)
    helpers = User.joins(:helped_repos).joins(:repos).where('repos.id' => 1)
    render :show, :locals => {:repo => repo, :user => user, :helpers => helpers}
  end
  
  def toggle_need_help
    @repo_name = params[:repo]
    @repo = Repo.find_by_full_name(@repo_name)
    @repo.toggle_need_help!
    @user_need_help = current_user.need_help_counter
    respond_to do |format|
      format.js
    end
  end

  def update_user_description
    @repo_name = params[:repo_name]
    @desc = params[:user_description]
    @repo = Repo.find_by_full_name(@repo_name)
    @repo.update_attribute(:user_description, @desc)

    respond_to do |format|
      format.js
    end
  end
end
