initialize = ->
  mapOptions =
    zoom: 14
    center: new google.maps.LatLng(40.018, 254.720)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
map = undefined
google.maps.event.addDomListener window, "load", initialize