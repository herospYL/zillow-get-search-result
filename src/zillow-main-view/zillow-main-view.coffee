Polymer
  is: 'zillow-main-view'

  properties:
    address:
      type: String
      notify: true

    cityState:
      type: String
      notify: true

    zip:
      type: String
      notify: true

    validResult:
      type: Object

    invalidResult:
      type: Object

  _testGet: ->
    promise = @$.xhr.send({
      url: "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1fi61fdynm3_9r65p&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA",
      handleAs: 'xml'
    })

    promise.then (result) =>
      console.log(result.response)
      obj = result.response.getElementsByTagName('response')[0]
      console.log(obj)
      return