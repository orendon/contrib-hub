module WannahelpHelper
  def current_value(key)
    (params[:q] ? params[:q][key]: "")
  end

  def get_filter(languages)
    [["All", ""]] + languages
  end
end
