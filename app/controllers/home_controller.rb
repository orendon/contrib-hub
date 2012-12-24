class HomeController < ApplicationController

  def index
    @featured_repos = Repo.get_featured_repos(3)
  end

  def users_map
    users = User.get_users_needing_help
    coords = users.map(&:coords)
    render :json => coords.to_json
  end
end