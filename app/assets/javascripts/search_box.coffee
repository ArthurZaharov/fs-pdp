class @SearchBox
  constructor: (map) ->
    input = document.getElementById("pac-input")
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input)
