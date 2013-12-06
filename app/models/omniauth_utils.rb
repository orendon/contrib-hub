class OmniauthUtils
  def self.normalize_hash(auth_hash)
    {
      github_id:    auth_hash["info"]["nickname"],
      token:        auth_hash["credentials"]["token"],
      name:         auth_hash["info"]["name"],
      email:        auth_hash["info"]["email"],
      location:     auth_hash["extra"]["raw_info"]["location"],
      avatar_url:   auth_hash["extra"]["raw_info"]["avatar_url"],
      github_url:   auth_hash["extra"]["raw_info"]["html_url"],
      public_repos: auth_hash["extra"]["raw_info"]["public_repos"],
      public_gists: auth_hash["extra"]["raw_info"]["public_gists"],
      followers:    auth_hash["extra"]["raw_info"]["followers"],
      following:    auth_hash["extra"]["raw_info"]["following"]
    }
  end
end