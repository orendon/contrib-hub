class ReposController < ApplicationController
  def toggle_need_help
    @repo_name = params[:repo]
    @repo = Repo.init_and_toggle_repo(current_user, @repo_name)
    @user_need_help = Repo.get_needing_help_counter_for(current_user.id).count
    respond_to do |format|
      format.js
    end
  end

  def update_user_description
    repo_name, desc = params[:repo], params[:user_description]
    @repo = Repo.find_by_user_id_and_full_name(current_user.id, params[:repo])
    @repo.user_description = desc
    @repo.save!

    respond_to do |format|
      format.js { @repo }
    end
  end

  def post_repo
    @repo = Repo.find(params[:repo_id])
    content = view_context.markdown(@repo.user_description)
    respond_to do |format|
      format.json { render json: content.to_json }
    end
  end

end
