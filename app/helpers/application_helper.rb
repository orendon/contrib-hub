module ApplicationHelper
  def get_css_status(user, repo)
    return "i-help-button" if repo.is_being_helped_by?(user)
    repo.need_help ? "help-button" : "no-help-button"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    #link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    if css_class
      link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    else
      link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    end
  end
end
