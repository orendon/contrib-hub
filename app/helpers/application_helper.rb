module ApplicationHelper
  def get_css_status(user, repo)
    return "i-help-button" if repo.is_being_helped_by?(user)
    repo.need_help ? "help-button" : "no-help-button"
  end
end
