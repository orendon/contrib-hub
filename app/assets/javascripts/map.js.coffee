var map_center = new google.maps.LatLng(19.311143,-39.199219);
//var medellin = new google.maps.LatLng(6.29, -75.54);
var marker;
var map;

function initialize_map() {
  console.log("init.map");

  var mapOptions = {
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: map_center
  };

  map = new google.maps.Map(document.getElementById('mapa'), mapOptions);
  loadUsersData();
}

function loadUsersData() {
  $.getJSON('/users_map.json', function(data){
    $.each(data, function(key, value){
      user_location = new google.maps.LatLng(value.latitude, value.longitude);
      addMarker(user_location);
    });
  });
}

function addMarker(place) {
  marker = new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: place
  });
  google.maps.event.addListener(marker, 'click', bounceOnce);
}

function bounceOnce() {
  marker.setAnimation(google.maps.Animation.BOUNCE);
  setInterval(stopBounce, 1000);
}

function stopBounce() {
  marker.setAnimation(null)
}

function toggleBounce() {
  if (marker.getAnimation() != null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}

$(document).ready(function() {
  initialize_map();
});