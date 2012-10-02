class WannahelpController < ApplicationController
  def index
    @repos = Repo.get_repos_form_others(current_user)
  end

  def update
    repo = Repo.find(params[:id])
    current_user.update_repo_status(repo)

    #star(repo.user, repo.name)
    redirect_to user_wannahelp_index_path(current_user)
  end

  private
    def star(user, repo)
      github = Github.new oauth_token: user.token
      github.repos.starring.starred(owner: user.github_id, repo: repo)
    end
end