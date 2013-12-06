class ReposDatatable
  include Rails.application.helpers
  include ActionView::Helpers::DateHelper
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Repo.count,
      iTotalDisplayRecords: repos.count,
      aaData: data
    }
  end

private

  def data
    repos.map do |repo|
      [
        "<a href='#' class='results-tooltip' rel='tooltip' data-placement='top' data-original-title='#{repo.description}' data-content='#{repo.description}'>
          <i class='icon-question-sign'>  </i>
        </a>",
        link_to(repo.full_name, repo.github_url),
        repo.open_issues,
        repo.forks,
        repo.language,
        if repo.pushed_at
          "<small>#{time_ago_in_words(repo.pushed_at)}</small>"
        end,
        if repo.is_being_helped_by?(@view.current_user)
          link_to("Stop Helping", "#", class: "btn btn-danger wanna-help-btn", :"data-id" => repo[:id])
        else
          link_to("Wanna Help!", "#", class: "btn btn-success wanna-help-btn", :"data-id" => repo[:id])
        end
      ]
    end
  end

  def repos
    @repos ||= fetch_repos
  end

  def fetch_repos
    repos = Repo.order("#{sort_column} #{sort_direction}")
    repos = repos.page(page).per_page(per_page)
    if params[:sSearch].present?
      repos = repos.where("full_name like :search or language like :search", search: "%#{params[:sSearch]}%")
    end
    repos
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[description full_name open_issues forks language pushed_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
