class TaggingController < ApplicationController

  def update_tags
    @repo = Repo.find_by_github_id_and_user_id(params[:github_id], current_user.id)
    @repo ||= Repo.init_repo(current_user, params[:repo_name], false)
    @repo.tag_list = params[:tag_list]
    @repo.save!
    respond_to do |format|
      format.js { @repo }
    end
  end

end
