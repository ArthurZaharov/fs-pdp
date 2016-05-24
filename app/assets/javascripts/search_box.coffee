class @SearchBox
  ui:
    input: $("#search-box")
    search: $(".search-authors")
    searchContainer: $(".search-container")

  constructor: (map) ->
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(@ui.search[0])
    @ui.search.removeClass("hide")
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
    @ui.searchContainer.html("")

    authors.forEach (author) =>
      @ui.searchContainer[0].appendChild(new Author(author).element)
