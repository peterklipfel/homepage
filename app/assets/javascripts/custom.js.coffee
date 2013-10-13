$ ->
  if $('body').hasClass('index')
    initialize = ->
      isGoogleBot = navigator.userAgent.toLowerCase().indexOf('googlebot') > -1
      if isGoogleBot
        return; # "Sorry, we have no imagery here" BUG
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

  if $('body').hasClass('music')
    getSoundcloud = ->
      $.ajax "http://api.soundcloud.com/users/18898030/tracks.json?client_id=d8279a8988edaef9b64257b6cb3e310a",
        success: (data) ->
          for track in data
            console.log(track.id)
            $('#embeds').append('
              <div class="row">
                <iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F'+track.id+'"></iframe>
              </div>
              <br/>
              ')

    getSoundcloud()