root = exports ? this

# This should only used while designing
SearchResults = root.SearchResults

Polymer
  is: 'zillow-content-overview'

  properties:
    overviewData:
      type: Object
      value: SearchResults.response.results[0].result