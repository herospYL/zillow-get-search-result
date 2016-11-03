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

    map.latitude = @mapData.latitude
    map.longitude = @mapData.longitude
    marker.latitude = @mapData.latitude
    marker.longitude = @mapData.longitude
    return