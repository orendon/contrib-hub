class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :validate_session

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def validate_session
      unless params[:controller] == "home"
        redirect_to root_path unless session[:user_id]
      end
    end
end
