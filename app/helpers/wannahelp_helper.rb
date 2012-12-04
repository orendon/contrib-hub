module WannahelpHelper
  def current_value(key)
    (params[:search] ? params[:search][key]: "")
  end

  def get_filter(languages)
    [["All", ""]] + languages
  end
end