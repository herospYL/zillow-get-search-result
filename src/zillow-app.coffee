Polymer
  is: 'zillow-app'

  properties:
    page:
      type: String
      reflectToAttribute: true

    searchString:
      type: String
      value: 'Zillow Get Search Result'

    validSearchResults:
      type: Array
      value: () -> []

    validSearchSelected:
      type: Number
      value: -1
      observer: '_selectResults'

    validSearchSelectedContent: Object

  observers:
    ['_routePageChanged(routeData.page)']

  _routePageChanged: (page) ->
    @page = page || 'main-view'
    return

  _selectResults: () ->
    obj = null
    if @validSearchSelected >= 0 and @validSearchSelected < @validSearchResults?.length
      obj = @validSearchResults[@validSearchSelected]

    @set('validSearchSelectedContent', obj)