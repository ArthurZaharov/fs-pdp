class Request
  constructor: (@data = {}) ->

  get: (param) ->
    @data[param]

App.request = new Request(App.requestData)
