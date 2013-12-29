module ApplicationHelper
  def get_css_status(user, repo)
    return "i-help-button" if repo.is_being_helped_by?(user)
    repo.need_help ? "help-button" : "no-help-button"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to (css_class ? title + direction_icon(direction) : title).html_safe, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  private

  def direction_icon(direction)
    "<i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>"
  end
end
