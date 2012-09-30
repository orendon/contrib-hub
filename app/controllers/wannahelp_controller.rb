
class WannahelpController < ApplicationController
  def index
    @repos = Repo.limit(5)
  end
end