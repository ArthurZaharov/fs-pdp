class Map
  constructor: ->
    elem = document.getElementById("map")
    center =
      lat: 29.951066
      lng: -90.071532
    @map = new google.maps.Map elem, { center: center, zoom: 11 }
    @fetchAuthors()

  bindEvents: () ->
    @map.addListener "dragend", @fetchAuthors
    @map.addListener "zoom_changed", @fetchAuthors

  init: ->
    @bindEvents()
    navigator.geolocation.getCurrentPosition(@byBrowserPosition, @byIpPosition)

  mapCenter: ->
    lat: @map.getCenter().lat()
    lng: @map.getCenter().lng()

  fetchAuthors: () =>
    $.ajax
      url: "/authors"
      dataType: "json"
      data:
        center: @mapCenter(),
        radius: 100
      success: (data) =>
        $.each data, (index, author) =>
          new Author(author).show(@map)

  byBrowserPosition: (position) =>
    @map.setCenter
      lat: position.coords.latitude
      lng: position.coords.longitude

  byIpPosition: =>
    $.ajax
      url: "https://freegeoip.net/json/#{App.request.get('ip')}"
      timeout: 3000,
      success: (position) =>
        if position.latitude != 0 || position.longitude != 0
          @map.setCenter
            lat: position.latitude
            lng: position.longitude

$ ->
  if $("#map").length > 0
    new Map().init()