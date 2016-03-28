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
    $.ajax
      url: "https://freegeoip.net/json/#{App.request.get('ip')}"
      timeout: 3000,
      success: (position) =>
        @renderMap
          lat: position.latitude
          lng: position.longitude
      error: () =>
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
