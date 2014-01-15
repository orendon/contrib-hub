# Build a URL using Google Static Maps API
class MapUrlBuilder

  USER_PROFILE_DIMENSIONS   = '350x350'
  SEARCH_RESULTS_DIMENSIONS = '250x250'

  def initialize(size='100x100')
    @size, @markers = size, []
  end

  def self.user_profile_map(user)
    map = MapUrlBuilder.new(USER_PROFILE_DIMENSIONS)
    map.add_marker('blue', user.coords_and_github_id)
    map.add_markers('red', user.helped_repos_coords)
    map.url
  end

  def self.search_results_map(repos)
    repos_map_data = repos.map { |repo| repo.user.coords_and_github_id }

    MapUrlBuilder.new(SEARCH_RESULTS_DIMENSIONS).add_markers('red', repos_map_data).url
  end

  def add_marker(colour, geolocation_data)
    @markers << build_marker_params(colour, geolocation_data[:latitude], geolocation_data[:longitude])
    self
  end

  def add_markers(colour, geolocation_data)
    geolocation_data.each { |data| add_marker(colour, data) }
    self
  end

  def url
    google_map_url = "http://maps.google.com/maps/api/staticmap?&size=%{size}&maptype=roadmap%{markers}&sensor=false"

    repos_map_url = google_map_url % { size: @size, markers: @markers.join }
    repos_map_url << "&zoom=13" if @markers.size == 1
    repos_map_url
  end

  private

  def build_marker_params(colour, latitude, longitude)
    "&markers=color:#{colour}%7Clabel:O%7C#{latitude},#{longitude}"
  end

end
