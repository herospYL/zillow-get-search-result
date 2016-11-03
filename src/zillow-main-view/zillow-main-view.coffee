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
    
    ZWSID:
      type: String
      value: 'X1-ZWz1fi61fdynm3_9r65p'

  observers: [
    'hideClear(address, cityState, zip, validSearchResults, invalidSearchResult)'
  ]

#  attached: ->
#    @_getZWSID()
#    return

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

    @clearResult()
    return

  clearResult: ->
    @set('validSearchResults', [])
    @set('validSearchSelected', -1)
    @set('isInvalid', false)
    @set('invalidSearchResult', '')
    Polymer.dom.flush()
    return

  fireSearch: ->
    @clearResult()
#    if @ZWSID == undefined || @ZWSID == null
#      @_getZWSID()

    queryParam = {}
    queryParam["zws-id"] = @ZWSID
    queryParam["address"] = @address
    queryParam["citystatezip"] = "#{@cityState} #{@zip}"

    ajax = @$.ajax
    ajax.params = queryParam
    ajax.generateRequest()
    return

  handleResponse: (event, detail) ->
    if detail.response
      @_parseResult(detail.response)
    return

  handleError: (event, detail) ->
    @fire('toast-error', detail.error)
    return

#  _getZWSID: ->
#    promise = @$.xhr.send({
#      url: "http://liangyuanzillowapi.azurewebsites.net/api/zillow",
#      handleAs: 'json'
#    })
#
#    promise.then (result) =>
#      @set('ZWSID', result.response)
#      return

  _parseResult: (doc) ->
    if doc
      x2js = new X2JS()
      jsonObj = x2js.xml2json(doc)
      searchResults = jsonObj.searchresults

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

            for re in results.result
              if re.localRealEstate
                lre = re.localRealEstate
                if not (lre.region instanceof Array)
                  regArr = []
                  regArr[0] = lre.region
                  lre.region = regArr

            @set('validSearchResults', results.result)
    return