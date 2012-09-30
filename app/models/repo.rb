class Repo < ActiveRecord::Base
  attr_accessible :github_url, :name, :need_help, :user_id

  belongs_to :user
end
