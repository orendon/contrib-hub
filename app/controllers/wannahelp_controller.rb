
class WannahelpController < ApplicationController
  def index
    @repos = Repo.limit(5)
  end

  def update
    repo = Repo.find(params[:id])
    current_user.update_repo_status(repo)

    #star(repo.user, repo.name)
    redirect_to user_wannahelp_index_path(current_user)
  end

  private
    def star(user, repo)
      github = Github.new basic_auth: 'gomayonqui:desarrollo1'
      github.repos.starring.starred(owner: user.github_id, repo: repo)
    end
end