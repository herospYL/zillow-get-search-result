#TODO: API Key hardcoded!

Polymer
  is: 'zillow-content-map'

  properties:
    mapData:
      type: Object
      observer: '_calculateCoordinates'

    gMapApiKey: String

  ready: ->
    @_getGoogleMapKey()
    return

  _calculateCoordinates: ->
    if @gMapApiKey == undefined || @gMapApiKey == null
      @_getGoogleMapKey()
    map = @$.gMap
    marker = @$.gMarker

    map.latitude = parseFloat(@mapData.latitude)
    map.longitude = parseFloat(@mapData.longitude)
    marker.latitude = parseFloat(@mapData.latitude)
    marker.longitude = parseFloat(@mapData.longitude)
    return

  _getGoogleMapKey: ->
    promise = @$.xhr.send({
      url: "http://liangyuanzillowapi.azurewebsites.net/api/googlemapkey"
    })

    promise.then (result) =>
      console.log(result.response)
      @set('gMapApiKey', result.response)
      return