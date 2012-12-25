class MapUrlBuilder

  def initialize(size)
    @size, @markers = size, []
  end

  def self.user_map(user)
    map = MapUrlBuilder.new('350x350')
    map.add_marker('blue', user.coords)
    map.add_markers('red', user.helped_repos_coords)
    map.url
  end

  def self.search_map(repos)
    MapUrlBuilder.new('250x250').add_markers('red', repos.map(&:coords)).url
  end

  def add_marker(colour, coords)
    @markers << build_string(colour, coords[:latitude], coords[:longitude])
    self
  end

  def add_markers(colour, items)
    items.each{ |i| @markers << build_string( colour, i[:latitude], i[:longitude] ) }
    self
  end

  def url
    map_url = "http://maps.google.com/maps/api/staticmap?&size=#{@size}&maptype=roadmap#{@markers.join}&sensor=false"
    map_url << "&zoom=13" if map_url.scan(/markers/).count == 1
    map_url
  end

  private

  def build_string(colour, latitude, longitude)
    return '' if [latitude, longitude].any?{|l| l.nil? }
    "&markers=color:#{colour}%7Clabel:O%7C#{latitude},#{longitude}"
  end

end