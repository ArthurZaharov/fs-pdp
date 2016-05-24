class @Map
  mapElement: document.getElementById("map")
  defaultMapOptions:
    center:
      lat: 29.951066
      lng: -90.071532
    zoom: 11

  constructor: ->
    @map = new google.maps.Map(@mapElement, @defaultMapOptions)
    navigator.geolocation.getCurrentPosition(@byBrowserPosition, @byIpPosition)
    @bindEvents()

  bindEvents: () ->
    @map.addListener("bounds_changed", @fetchAuthors)
    google.maps.event.addListenerOnce(@map, "idle", () => new SearchBox(@map))

  mapBounds: ->
    @map.getBounds()

  swPoint: ->
    @mapBounds().getSouthWest()

  nePoint: ->
    @mapBounds().getNorthEast()

  moveToMarker: (marker) =>
    @map.setCenter
      lat: marker.position.lat()
      lng: marker.position.lng()

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
