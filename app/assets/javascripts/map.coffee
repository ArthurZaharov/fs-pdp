class Map
  constructor: ->
    @elem = document.getElementById("map")
    @options =
      center:
        lat: -34.397
        lng: 150.644
      zoom: 8

  init: ->
    new google.maps.Map(@elem, @options)

$ ->
  if $("#map").length > 0
    new Map().init()
