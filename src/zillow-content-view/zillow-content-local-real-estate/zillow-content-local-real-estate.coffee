root = exports ? this

SearchResults = root.SearchResults

Polymer
  is: 'zillow-content-local-real-estate'

  properties:
    localRealEstateData:
      type: Object
      value: SearchResults.response.results[0].result.localRealEstate.region