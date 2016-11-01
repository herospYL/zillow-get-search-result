Polymer
  is: 'zillow-main-result'

  properties:
    validSearchResults:
      type: Array
      value: () -> []
      observer: 'addingSearchResultChildren'

    validSearchSelected:
      type: Number
      notify: true

  addingSearchResultChildren: () ->
    if @validSearchResults
      parent = @$.listbox

#      Remove old children
      oldChildren = Polymer.dom(parent).childNodes
      if oldChildren.length > 0
        for old in oldChildren
          Polymer.dom(parent).removeChild(old)

#       Add New Children
      for item in @validSearchResults
        domItem = document.createElement('zillow-main-result-item')
        domItem.address = item.address.street
        domItem.city = item.address.city
        domItem.state = item.address.state
        domItem.zip = item.address.zipcode

        Polymer.dom(parent).appendChild(domItem)

      Polymer.dom.flush()
#      Interrogate the DOM