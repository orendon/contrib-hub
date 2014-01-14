module RepoPresenter
  def current_tags
    tag_list.empty? ? [] : self.tag_list
  end

  def coords
    { :latitude => user.latitude, :longitude => user.longitude }
  end

  def coords_and_github_id
    { :latitude => user.latitude, :longitude => user.longitude, :github_id => user.github_id }
  end

  def is_fork?
    fork
  end
end
