module RepoPresenter
  def current_tags
    tag_list.empty? ? [] : self.tag_list
  end
  
  def coords
    {:latitude => user.latitude, :longitude => user.longitude}
  end
end