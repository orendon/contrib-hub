class User < ActiveRecord::Base
  attr_accessible :github_id, :name, :token

  has_many :repos

  def self.find_or_create_from(auth_data)
    login = auth_data["info"]["nickname"]
    token = auth_data["credentials"]["token"]
    name = auth_data["info"]["name"]

    user = find_by_github_id(login)

    if user
      user.token = token
      user.save!
    else
      user = User.create!(github_id: login, name: name, token: token)
    end
    user
  end
end
