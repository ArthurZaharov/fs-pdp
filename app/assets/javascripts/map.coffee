class Map
  constructor: ->
    @elem = document.getElementById("map")

  init: ->
    navigator.geolocation.getCurrentPosition(@byBrowserPosition, @byIpPosition)

  byBrowserPosition: (position) =>
    @renderMap
      lat: position.coords.latitude
      lng: position.coords.longitude

  byIpPosition: =>
    if App.currentIPLocation[0] != 0 || App.currentIPLocation[1] != 0
      @renderMap
        lat: App.currentIPLocation[0]
        lng: App.currentIPLocation[1]
    else
      @byDefaultPosition()

  byDefaultPosition: =>
    @renderMap
      lat: 29.951066
      lng: -90.071532

  renderMap: (center) ->
    new google.maps.Map(@elem, { center: center, zoom: 11 })

$ ->
  if $("#map").length > 0
    new Map().init()
