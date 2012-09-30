class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from(auth_data)
    session[:user_id] = user.id

    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def auth_data
      request.env["omniauth.auth"]
    end  
end