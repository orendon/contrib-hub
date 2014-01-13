# medellin coords 6.29, -75.54
map_center = new google.maps.LatLng(19.311143,-39.199219)
marker = null
map = null

initialize_map = ->
  mapOptions =
    zoom: 2,
    scrollwheel: false,
    draggable: true,
    panControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: map_center

  map = new google.maps.Map(document.getElementById('mapa'), mapOptions)
  loadUsersData()

loadUsersData = ->
  $.getJSON '/users_map.json', (data) ->
    $.each data, (key, value) ->
      user_location = new google.maps.LatLng(value.latitude, value.longitude)
      addMarker(user_location, value.github_id)

addMarker = (place, github_id) ->

  infowindow = new google.maps.InfoWindow
    content: 'Github: <a href="http://github.com/' + github_id + '">' + github_id + '</a>'

  marker = new google.maps.Marker
    map: map,
    position: place

  google.maps.event.addListener marker, 'click', ->
    infowindow.open(map, this)


$(document).ready ->
  initialize_map()
