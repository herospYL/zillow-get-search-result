Polymer
  is: 'zillow-main-view'

  properties:
    input:
      type: String
      notify: true

    hideClear: false

  observers: [
    '_hideClearButton(input)'
  ]

  _hideClearButton: (input) ->
    return @set('hideClear', !!input)

  clearInput: ->
    @set('input', "")