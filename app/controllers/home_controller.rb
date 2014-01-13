class HomeController < ApplicationController

  def index
    @featured_repos = Repo.get_featured_repos(3)
  end

  def users_map
    users = User.get_users_needing_help
    coords_and_github_id = users.map(&:coords_and_github_id)
    render :json => coords_and_github_id.to_json
  end
end
