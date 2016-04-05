class @Author
  constructor: (@data = {}) ->
    @marker = new google.maps.Marker
      position:
        lat: @get("latitude")
        lng: @get("longitude")
      title: @get("full_name")
    @bindEvents()

  get: (param) ->
    @data[param]

  bindEvents: () ->
    @marker.addListener "click", () =>
      window.location = "/authors/#{@get('id')}"

  show: (map) ->
    @marker.setMap(map)

  hide: () ->
    @marker.setMap(null)
