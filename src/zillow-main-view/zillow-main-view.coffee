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
      notify: true

    invalidResult:
      type: Object
      notify: true

  _testGet: ->
    promise = @$.xhr.send({
      handleAs: 'xml'
    })

    promise.then (result) =>
      console.log(result.response)
#      console.log(result.response.getElementsByTagName('response')[0])
      obj = result.response.getElementsByTagName('response')[0]
      console.log(obj)
      return