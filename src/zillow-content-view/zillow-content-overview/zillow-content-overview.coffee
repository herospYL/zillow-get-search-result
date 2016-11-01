Polymer
  is: 'zillow-content-overview'

  properties:
    overviewData: Object

    overviewSelected:
      type: Number
      value: -1

  _computeSelected: (value) ->
    value + 1
#    Convert 0-base to 1-base