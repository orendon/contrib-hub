require "github_api"

class ProfilesController < ApplicationController

  def index
    @user = get_user_info session[:token]
  end

  private
    def get_user_info(user_token)
      github = Github.new basic_auth: 'gomayonqui:desarrollo1' #oauth_token: user_token
      @user = github.users.get
    end
end