class Map
  constructor: ->
    @defaultOptions =
      center:
        lat: 29.951066
        lng: -90.071532
      zoom: 11
    @elem = document.getElementById("map")

  init: ->
    navigator.geolocation.getCurrentPosition (position) =>
      options =
        center:
          lat: position.coords.latitude
          lng: position.coords.longitude
        zoom: 11
      @map = new google.maps.Map(@elem, options)

$ ->
  if $("#map").length > 0
    new Map().init()
