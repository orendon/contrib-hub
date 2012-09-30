class User < ActiveRecord::Base
  attr_accessible :github_id, :name

  def self.find_or_create_from(auth_data)
    login = auth_data["extra"]["login"]
    token = auth_data["credentials"]["token"]

    existing_user = find_by_github_id(login)

    if existing_user
      existing_user.update(token: token)
    else
      create! do |user|
        user.github_id = login
        user.name = auth_data["info"]["name"]
        user.token = token
      end
    end
  end
end
