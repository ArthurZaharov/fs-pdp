class @Author
  constructor: (data = {}) ->
    @position =
      lat: data.latitude
      lng: data.longitude
    @title = data.full_name

  show: (map) ->
    @marker = new google.maps.Marker
      position: @position
      map: map
      title: @title

  hide: () ->
    @marker.setMap(null)
