Polymer
  is: 'zillow-app'

  properties:
    page:
      type: String
      reflectToAttribute: true

    searchString:
      type: String
      value: 'Zillow Get Search Result'

    showSearchBar: false

  observers:
    ['_routePageChanged(routeData.page)']

  _routePageChanged: (page) ->
    @page = page || 'main-view'
    return

  toggleSearchBar: ->
    @set('showSearchBar', !@showSearchBar)