require "github_api"

class UsersController < ApplicationController

  def show
    @user = get_info_for(current_user)
  end

  def needhelp

  end

  private
    def get_info_for(user)
      github = Github.new basic_auth: 'gomayonqui:desarrollo1' # oauth_token: user.token
      @user = github.users
    end
end