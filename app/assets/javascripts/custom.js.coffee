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

    roundRect = (ctx, x, y, width, height, radius, fill, stroke) ->
      stroke = true  if typeof stroke is "undefined"
      radius = 5  if typeof radius is "undefined"
      ctx.beginPath()
      ctx.moveTo x + radius, y
      ctx.lineTo x + width - radius, y
      ctx.quadraticCurveTo x + width, y, x + width, y + radius
      ctx.lineTo x + width, y + height - radius
      ctx.quadraticCurveTo x + width, y + height, x + width - radius, y + height
      ctx.lineTo x + radius, y + height
      ctx.quadraticCurveTo x, y + height, x, y + height - radius
      ctx.lineTo x, y + radius
      ctx.quadraticCurveTo x, y, x + radius, y
      ctx.closePath()
      ctx.stroke()  if stroke
      ctx.fill()  if fill
    canvasId = "computer-monitor"
    canvas = document.getElementById(canvasId)
    div = document.getElementById("monitor-wrapper")
    ctx = canvas.getContext("2d")
    back = undefined
    canvas.width = canvas.clientWidth
    canvas.height = canvas.clientHeight
    width = canvas.width
    height = canvas.height

    # MONITOR
    monitorWidth = 1.7 * width/3
    monitorHeight = height/2

    # Create gradient
    back = ctx.createLinearGradient(monitorHeight, monitorWidth - (0.04 * monitorWidth), 0.000, 14.000)

    # Add colors
    back.addColorStop 0.336, "rgba(42, 42, 44, 1.000)"
    back.addColorStop 0.336, "rgba(58, 58, 60, 1.000)"

    # Fill with gradient
    ctx.fillStyle = back
    roundRect ctx, width/2 - monitorWidth/2, height/3.5 - monitorHeight/2, monitorWidth, monitorHeight, 20, back
    screenWidth = monitorWidth * 0.93
    screenHeight = monitorHeight * 0.84
    $(window).scroll ->
      if Math.random() > 0.67
        ctx.fillStyle = "#f1f7f7"
        ctx.fillRect width/2 - screenWidth/2, height/3.5 - screenHeight/2, screenWidth, screenHeight
        for number in [0..255]
          eqHeight = Math.random()*screenHeight
          color = '#'+(Math.floor(10*eqHeight/256)).toString(16)+(Math.floor(14*eqHeight/256)).toString(16)+(Math.floor(11*eqHeight/256)).toString(16)
          ctx.fillStyle = color
          ctx.fillRect width/2 - screenWidth/2 + number*screenWidth/256, height/3.5 + screenHeight/2 - eqHeight, screenWidth/256, eqHeight

    ctx.fillStyle = "#f1f7f7"
    ctx.fillRect width/2 - screenWidth/2, height/3.5 - screenHeight/2, screenWidth, screenHeight

    # CAMERA
    camDiameter = 10
    ctx.beginPath()
    ctx.fillStyle = "#111"
    ctx.arc width/2 - camDiameter/2, height/3.5 - monitorHeight/2 + camDiameter/2 + camDiameter/2, camDiameter/2, 0, Math.PI * 2, true
    ctx.closePath()
    ctx.fill()

    # STAND
    standHeight = monitorHeight/6.5
    standWidth = monitorWidth/5
    ctx.fillStyle = "#d1d2d4"
    ctx.fillRect width/2 - standWidth/2, height/3.5 + monitorHeight/2, standWidth, standHeight/3
    ctx.fillStyle = "#f3f3f3"
    ctx.fillRect width/2 - standWidth/2, height/3.5 + monitorHeight/2 + standHeight/3, standWidth, 2 * standHeight/3
    ctx.fillStyle = "#e7e8ea"
    ctx.fillRect width/2 - standWidth, height/3.5 + monitorHeight/2 + standHeight, standWidth * 2, standHeight/10

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