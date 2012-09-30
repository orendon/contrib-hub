require "github_api"

class UsersController < ApplicationController

  def show
    @user = get_info_for(current_user)
  end

  private
    def get_info_for(user)
      github = Github.new oauth_token: user.token
      @user = github.users.get
    end
end