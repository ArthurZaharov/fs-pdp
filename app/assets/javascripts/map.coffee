class @Map
  mapElement: document.getElementById("map")
  defaultCenter:
    lat: 29.951066
    lng: -90.071532

  constructor: ->
    @map = new google.maps.Map(@mapElement, { center: @defaultCenter, zoom: 11 })
    navigator.geolocation.getCurrentPosition(@byBrowserPosition, @byIpPosition)
    @bindEvents()
    new SearchBox(@map)

  bindEvents: () ->
    @map.addListener("bounds_changed", @fetchAuthors)

  mapBounds: ->
    @map.getBounds()

  swPoint: ->
    @mapBounds().getSouthWest()

  nePoint: ->
    @mapBounds().getNorthEast()

  fetchAuthorsParams: ->
    bounds:
      sw_point:
        lat: @swPoint().lat()
        lng: @swPoint().lng()
      ne_point:
        lat: @nePoint().lat()
        lng: @nePoint().lng()

  fetchAuthors: () =>
    $.ajax
      url: "/authors"
      dataType: "json"
      data: @fetchAuthorsParams()
      success: @showAuthors

  showAuthors: (data) =>
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
