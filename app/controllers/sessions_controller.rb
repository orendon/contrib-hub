class SessionsController < ApplicationController
  def create
    session[:token] = auth_data[:token]
    redirect_to profiles_path
  end

  private
    def auth_data
      request.env["omniauth.auth"]
    end  
end