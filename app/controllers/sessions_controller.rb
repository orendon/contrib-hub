class SessionsController < ApplicationController

  def create
    user = User.find_by_github_id(auth_data[:login]) || User.create_from(auth_data)
    session[:user_id] = user.id

    redirect_to user_path(user)
  end

  private
    def auth_data
      request.env["omniauth.auth"]
    end  
end