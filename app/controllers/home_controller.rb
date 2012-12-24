class HomeController < ApplicationController

  def index
  end

  def users_map
    users = User.joins(:repos).where("repos.need_help=?", true)
    coords = users.map(&:coords)
    render :json => coords.to_json
  end
end