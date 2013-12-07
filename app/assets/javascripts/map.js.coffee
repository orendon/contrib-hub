# medellin coords 6.29, -75.54
map_center = new google.maps.LatLng(19.311143,-39.199219)
marker = null
map = null

initialize_map = ->
  mapOptions =
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: map_center

  map = new google.maps.Map(document.getElementById('mapa'), mapOptions)
  loadUsersData()

loadUsersData = ->
  $.getJSON '/users_map.json', (data) ->
    $.each data, (key, value) ->
      user_location = new google.maps.LatLng(value.latitude, value.longitude)
      addMarker(user_location)

addMarker = (place) ->
  marker = new google.maps.Marker
    map: map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: place

  google.maps.event.addListener(marker, 'click', bounceOnce)

bounceOnce = ->
  marker.setAnimation(google.maps.Animation.BOUNCE)
  setInterval(stopBounce, 1000)

stopBounce = ->
  marker.setAnimation(null)

toggleBounce = ->
  if marker.getAnimation() != null
    marker.setAnimation(null)
  else
    marker.setAnimation(google.maps.Animation.BOUNCE)

$(document).ready ->
  initialize_map()
