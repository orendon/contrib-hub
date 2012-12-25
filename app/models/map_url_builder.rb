class MapUrlBuilder

  def initialize(size)
    @size, @markers = size, []
  end

  def self.helper_map(users, repo)
    user_coords = users.map{|u| u.coords }
    MapUrlBuilder.new('500x300').add_markers('blue', user_coords).add_marker('red', repo.coords).url
  end

  def self.user_map(user)
    MapUrlBuilder.new('350x350').add_marker('blue', user.coords).url
  end

  def self.search_map(repos)
    MapUrlBuilder.new('250x250').add_markers('red', repos).url
  end

  def add_marker(colour, coords)
    @markers << build_string(colour, coords[:latitude], coords[:longitude])
    self
  end

  def add_markers(colour, items)
    items.each{ |i| @markers << build_string( colour, i.coords[:latitude], i.coords[:longitude] ) }
    self
  end

  def url
    "http://maps.google.com/maps/api/staticmap?&size=#{@size}&maptype=roadmap#{@markers.join}&sensor=false"
  end

  private

  def build_string(colour, latitude, longitude)
    return '' if [latitude, longitude].any?{|l| l.nil? }
    "&markers=color:#{colour}%7Clabel:O%7C#{latitude},#{longitude}"
  end

end