class @SearchBox
  input: $("#search-box")

  constructor: (map) ->
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(@input[0])
    @bindEvents()

  bindEvents: ->
    @input.on("keyup", @searchArticles)

  searchArticles: =>
    $.ajax
      url: "/search_authors"
      dataType: "json"
      data:
        query: @input.val()
      success: @showAuthors

  showAuthors: (data) ->
    alert(data[0])
