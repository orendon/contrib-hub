class WannahelpController < ApplicationController
  helper_method :sort_column, :sort_direction
  include Utils

  def index
    @repos = Repo.where("need_help = ? and user_id != ?", true, current_user.id).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 12, :page => params[:page])
    @languages = get_all_languages
  end

  def toggle
    @repo_id = params[:repo]
    @repo = Repo.find(@repo_id)
    current_user.update_repo_status(@repo)
    #star(repo.user, repo.name)
    respond_to do |format|
      format.js
    end
  end

  private

  def sort_column
    Repo.column_names.include?(params[:sort]) ? params[:sort] : "full_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def star(user, repo)
    github = Github.new oauth_token: user.token
    github.repos.starring.starred(owner: user.github_id, repo: repo)
  end
end
