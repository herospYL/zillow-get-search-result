// Generated by CoffeeScript 1.11.1
(function() {
  Polymer({
    is: 'zillow-app',
    properties: {
      page: {
        type: String,
        reflectToAttribute: true
      },
      searchString: {
        type: String,
        value: 'Zillow Get Search Result'
      },
      validSearchResults: {
        type: Array,
        value: function() {
          return [];
        }
      },
      validSearchSelected: {
        type: Number,
        value: -1,
        observer: '_selectResults'
      },
      validSearchSelectedContent: Object
    },
    observers: ['_routePageChanged(routeData.page)'],
    _routePageChanged: function(page) {
      this.page = page || 'main-view';
    },
    _selectResults: function() {
      var obj, ref;
      obj = null;
      if (this.validSearchSelected >= 0 && this.validSearchSelected < ((ref = this.validSearchResults) != null ? ref.length : void 0)) {
        obj = this.validSearchResults[this.validSearchSelected];
      }
      return this.set('validSearchSelectedContent', obj);
    }
  });

}).call(this);

//# sourceMappingURL=zillow-app.js.map
