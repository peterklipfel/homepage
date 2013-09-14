$ ->
  if $('body').hasClass('landing_pages')
    initialize = ->
      myLatlng = new google.maps.LatLng(40.008, 254.730)
      mapOptions =
        zoom: 14
        scrollwheel: false
        center: myLatlng
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

      marker = new google.maps.Marker(
        position: myLatlng
        map: map
        title: "Hello World!"
      )
    map = undefined
    google.maps.event.addDomListener window, "load", initialize


    $(window).scroll ->
      $(".languages-me").css "background-position-y", ($(window).scrollTop()*80/$(document).height()).toString()+ "%"
      $(".tools-me").css "background-position-y", ($(window).scrollTop()*100/$(document).height()).toString()+ "%"
      $(".computer-me").css "background-position-y", ($(window).scrollTop()*100/$(document).height()).toString()+ "%"

