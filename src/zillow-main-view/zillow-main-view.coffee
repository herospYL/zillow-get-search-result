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
    Polymer.dom.flush()
    return

  fireSearch: ->
    @clearPage()
    queryParam = {}
    queryParam["address"] = @address
    queryParam["citystatezip"] = "#{@cityState} #{@zip}"

    ajax = @$.ajax
    ajax.params = queryParam
    ajax.generateRequest()

    return

  handleResponse: (event, detail) ->
    if detail.response
      message = detail.response.message
      if message
        code = message.code
        if code != "0"
          messageText = message.text
          @set('invalidSearchResult', messageText)
          @set('isInvalid', true)
        else
          response = detail.response.response
          @set('validSearchResults', response.results)
    return

  handleError: (event, detail) ->
    @fire('toast-error', detail.error)
    return