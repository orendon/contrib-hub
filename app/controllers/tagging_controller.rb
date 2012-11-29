class TaggingController < ApplicationController

  def update_tags
    @repo = Repo.find_by_full_name_and_user_id(params[:repo_name], current_user.id)
    need_help = @repo.nil? ? false : @repo.need_help
    @repo ||= Repo.init_repo(current_user, params[:repo_name], false)
    @repo.tag_list = params[:tag_list]
    @repo.need_help = need_help
    @repo.save!

    respond_to do |format|
      format.js { @repo }
    end
  end

end
