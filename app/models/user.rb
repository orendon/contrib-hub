class User < ActiveRecord::Base
  attr_accessible :github_id, :name

  def self.create_from(auth_data)
    create! do |user|
      user.github_id = auth_data[:login]
      user.name = auth_data[:name]
      user.token = auth_data[:token]
    end
  end
end
