class NeedhelpController < ApplicationController
  def create
    Repo.create_or_update(current_user, params)
    redirect_to user_path(current_user.id)
  end
end