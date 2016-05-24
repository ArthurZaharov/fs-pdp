class @Author
  constructor: (@data = {}) ->
    @marker = new google.maps.Marker
      position:
        lat: @get("latitude")
        lng: @get("longitude")
      title: @get("full_name")
    @element = document.createElement("div")
    @init()
    @bindEvents()

  get: (param) ->
    @data[param]

  init: ->
    @element.className = "search-box-item"
    @element.innerText = "#{@get('full_name')} (#{@get('city')})"
    @element.setAttribute("data-author-id", @get("id"))

  bindEvents: () ->
    @marker.addListener "click", @showAuthorPage
    $(@element).on "click", @showAuthorPage
    $(@element).on "mouseenter", @moveMapToAuthor

  showAuthorPage: =>
    window.location = "/authors/#{@get('id')}"

  moveMapToAuthor: =>
    App.map.moveToMarker(@marker)

  show: (map) ->
    @marker.setMap(map)

  hide: () ->
    @marker.setMap(null)
