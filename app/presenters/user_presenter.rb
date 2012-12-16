module UserPresenter
  def coords
    { latitude: self.latitude, longitude: self.longitude }
  end

  def helped_repos_coords
    coords = []
    helped_repos.each do |helping|
      coords << helping.repo.user.coords if helping.repo.user.location
    end
    coords
  end

  def need_help_counter
    self.repos.where(need_help: true).count
  end
end