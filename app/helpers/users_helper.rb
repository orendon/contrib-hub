module UsersHelper
  def status(repo)
    'hidden' unless repo[:need_help]
  end

  def build_static_map(user)
    user_marker = "&markers=color:blue%7Clabel:Y%7C#{user.latitude},#{user.longitude}" unless user.location.nil?
    helping_markers = build_repos_markers(user.helped_repos_coords)
    size = "250x250"
    map_url = "http://maps.google.com/maps/api/staticmap?&size=#{size}&maptype=roadmap#{user_marker}#{helping_markers}&sensor=false"
    image_tag map_url
  end

  private

  def build_repos_markers(coords)
    markers = ""
    coords.each do |coord|
      markers << "&markers=color:Red%7Clabel:R%7C#{coord[:latitude]},#{coord[:longitude]}"
    end
    markers
  end
end
