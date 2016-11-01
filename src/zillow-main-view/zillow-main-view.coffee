Polymer
  is: 'zillow-main-view'

  properties:
    address: String

    cityState: String

    zip: String

    validSearchResults:
      type: Array
      value: () -> []
      notify: true

    validSearchSelected:
      type: Number
      notify: true

    isInvalid: Boolean

    invalidSearchResult: String

    showClear: false

  observers: [
    'hideClear(address, cityState, zip, validSearchResults, invalidSearchResult)'
  ]

  hideClear: (address, cityState, zip, validSearchResults, invalidSearchResult) ->
    addressNull = address == undefined or address?.length == 0
    cityStateNull = cityState == undefined or cityState?.length == 0
    zipNull = zip == undefined or zip?.length == 0
    validSearchResultsNull = validSearchResults == undefined or validSearchResults?.length == 0
    invalidSearchResultNull = invalidSearchResult == undefined or invalidSearchResult?.length == 0

    @set('showClear', !(addressNull and cityStateNull and zipNull and validSearchResultsNull and invalidSearchResultNull))
    return

  clearPage: ->
    @set('address', '')
    @set('cityState', '')
    @set('zip', '')

    @set('validSearchResults', [])
    @set('validSearchSelected', -1)
    @set('isInvalid', false)
    @set('invalidSearchResult', '')
    return

  fireSearch: ->
    @clearPage()

    xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = (result) =>
      if result.target.readyState == 4 and result.target.status == 200
        @_parseResult(xhttp.responseXML);
    xhttp.open("GET", 'src/sample-response.xml', true)
    xhttp.send()

#    promise = @$.xhr.send({
#      url: "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1fi61fdynm3_9r65p&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA",
#      handleAs: 'xml'
#    })
#
#    promise.then (result) =>
#      console.log(result.response)
#      obj = result.response.getElementsByTagName('response')[0]
#      console.log(obj)
#      return

  _constructSearchString: ->
    return

  _parseResult: (doc) ->
    if doc
      x2js = new X2JS()
      jsonObj = x2js.xml2json(doc)
      searchResults = jsonObj.searchresults
      console.log(searchResults)

      if searchResults
        message = searchResults.message
        if message
          code = message.code
          if code != "0"
            messageText = message.text
            @set('invalidSearchResult', messageText)
            @set('isInvalid', true)
          else
            response = searchResults.response
            results = response.results
            if not (results.result instanceof Array)
              arr = []
              arr[0] = results.result
              results.result = arr
            @set('validSearchResults', results.result)

    return