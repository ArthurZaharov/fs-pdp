class @SearchBox
  ui:
    input: $("#search-box")
    searchContainer: $(".search-container")

  constructor: (map) ->
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(@ui.input[0])
    @bindEvents()

  bindEvents: ->
    @ui.input.on("keyup", @searchArticles)

  searchArticles: =>
    $.ajax
      url: "/search_authors"
      dataType: "json"
      data:
        query: @ui.input.val()
      success: @showAuthors

  showAuthors: (authors) =>
    @ui.searchContainer
      .html("")
      .css
        width: @ui.input.css("width")
        position: "absolute"
        top: @ui.input.css("height")
        left: @ui.input.css("left")

    authors.forEach (author) =>
      @ui.searchContainer[0].appendChild(new Author(author).element)
