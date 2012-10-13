class User < ActiveRecord::Base
  attr_accessible :github_id, :name, :token, :location, :latitude, :longitude

  # relations
  has_many :repos
  has_many :helped_repos

  # geolocation
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  # validations
  validates :github_id, :name, :token, :presence => true
  validates :github_id, :uniqueness => true

  def update_repo_status(repo)
    if repo.is_being_helped_by(self)
      HelpedRepos.find_by_user_id_and_repo_id(self.id, repo.id).destroy
    else
      HelpedRepos.create!(user_id: self.id, repo_id: repo.id)
    end
  end

  def self.find_or_create_from(auth_data)
    login = auth_data["info"]["nickname"]
    token = auth_data["credentials"]["token"]
    name = auth_data["info"]["name"]
    location = auth_data["extra"]["raw_info"]["location"]

    user = find_by_github_id(login)

    if user
      user.token = token
      user.location = location
      user.save!
    else
      user = User.create!(github_id: login, name: name, token: token, location: location)
    end
    user
  end
end
