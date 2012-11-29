class WannahelpController < ApplicationController
  def index
    @repos_search = Repo.search(build_filters(params))
    @languages = Repo.get_languages
  end

  def update
    repo = Repo.find(params[:id])
    current_user.update_repo_status(repo)

    #star(repo.user, repo.name)
    redirect_to user_wannahelp_index_path(current_user)
  end

  private
    def build_filters(params)
      filters = { "need_help_is_true" => true, "user_id_ne" => current_user.id }
      filters.merge!(params[:search]) if params && params.has_key?(:search)
      filters
    end

    def star(user, repo)
      github = Github.new oauth_token: user.token
      github.repos.starring.starred(owner: user.github_id, repo: repo)
    end
end
