module UserPresenter

  def coords_and_github_id
    { latitude: self.latitude, longitude: self.longitude, github_id: self.github_id }
  end

  def helped_repos_coords
    coords_and_github_id = []
    helped_repos.each do |helping|
      coords_and_github_id << helping.repo.user.coords_and_github_id if helping.repo.user.location
    end
    coords_and_github_id
  end

  def need_help_counter
    self.repos.where(need_help: true).count
  end
end
