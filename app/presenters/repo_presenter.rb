module RepoPresenter
  def current_tags
    tag_list.empty? ? [] : self.tag_list
  end
end