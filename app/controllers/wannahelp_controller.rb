class WannahelpController < ApplicationController
  include Utils

  def index
    #search_options = default_search_opts
    #search_options.merge!(:tags_name_in => params[:undefined][:tags]
      #) if search_with_tags?
    #search_options.merge!(:language_eq => params[:q][:language_eq]
      #) if params[:q]

    #@search = Repo.search(search_options)
    #@repos = @search.result(distinct: true).page(params[:page]).per(12)
    #@languages = get_all_languages
    #gon.tags = get_all_tag_names
    respond_to do |format|
      format.html
      format.json { render json: ReposDatatable.new(view_context) }
    end
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

  def default_search_opts
    {
      :need_help_true => true,
      :user_id_not_eq => current_user.id
    }
  end

  def search_with_tags?
    params[:undefined].present? && !params[:undefined][:tags].empty?
  end

  def star(user, repo)
    github = Github.new oauth_token: user.token
    github.repos.starring.starred(owner: user.github_id, repo: repo)
  end
end
