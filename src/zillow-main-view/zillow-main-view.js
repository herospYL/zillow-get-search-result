// Generated by CoffeeScript 1.11.1
(function() {
  Polymer({
    is: 'zillow-main-view',
    properties: {
      address: {
        type: String,
        notify: true
      },
      cityState: {
        type: String,
        notify: true
      },
      zip: {
        type: String,
        notify: true
      },
      validResult: {
        type: Object
      },
      invalidResult: {
        type: Object
      }
    },
    _testGet: function() {
      var promise;
      promise = this.$.xhr.send({
        url: "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1fi61fdynm3_9r65p&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA",
        handleAs: 'xml'
      });
      return promise.then((function(_this) {
        return function(result) {
          var obj;
          console.log(result.response);
          obj = result.response.getElementsByTagName('response')[0];
          console.log(obj);
        };
      })(this));
    }
  });

}).call(this);

//# sourceMappingURL=zillow-main-view.js.map
