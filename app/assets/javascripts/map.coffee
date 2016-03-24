class Map
  constructor: ->
    @elem = document.getElementById("map")

  init: ->
    navigator.geolocation.getCurrentPosition(@byBrowserPosition, @byDefaultPosition)

  byBrowserPosition: (position) =>
    @renderMap
      lat: position.coords.latitude
      lng: position.coords.longitude

  byDefaultPosition: =>
    @renderMap
      lat: 29.951066
      lng: -90.071532

  renderMap: (center) ->
    new google.maps.Map(@elem, { center: center, zoom: 11 })

$ ->
  if $("#map").length > 0
    new Map().init()
