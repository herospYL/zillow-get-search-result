// Generated by CoffeeScript 1.11.1
(function() {
  Polymer({
    is: 'zillow-content-map',
    properties: {
      mapData: {
        type: Object,
        observer: '_calculateCoordinates'
      },
      gMapApiKey: {
        type: String,
        value: 'AIzaSyD3E1D9b-Z7ekrT3tbhl_dy8DCXuIuDDRc'
      }
    },
    _calculateCoordinates: function() {
      var map, marker;
      map = this.$.gMap;
      marker = this.$.gMarker;
      map.latitude = parseFloat(this.mapData.latitude);
      map.longitude = parseFloat(this.mapData.longitude);
      marker.latitude = parseFloat(this.mapData.latitude);
      marker.longitude = parseFloat(this.mapData.longitude);
    }
  });

}).call(this);

//# sourceMappingURL=zillow-content-map.js.map
