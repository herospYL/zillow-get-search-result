#TODO: API Key hardcoded!

Polymer
  is: 'zillow-content-map'

  properties:
    mapData:
      type: Object
      observer: '_calculateCoordinates'

    gMapApiKey:
      type: String
      value: 'AIzaSyD3E1D9b-Z7ekrT3tbhl_dy8DCXuIuDDRc'

  _calculateCoordinates: ->
    map = @$.gMap
    marker = @$.gMarker

    map.latitude = parseFloat(@mapData.latitude)
    map.longitude = parseFloat(@mapData.longitude)
    marker.latitude = parseFloat(@mapData.latitude)
    marker.longitude = parseFloat(@mapData.longitude)
    return