Polymer
  is: 'zillow-content-zestimate'

  properties:
    zestimateData: Object

  observers: [
    'valueChangeColor(zestimateData.valueChange.__text)'
  ]

  valueChangeColor: (value) ->
    valueDiv = @$['zestimate-change-value']
    valueDivColor = ""
    if @_isPositive(value)
      valueDivColor = "green"
    else
      valueDivColor = "crimson"

    valueDiv.style.borderColor = valueDivColor
    valueDiv.style.color = valueDivColor
    return

  _amountSeparate: (amount) ->
    if typeof amount == 'string' and amount != null
      len = amount.length

      prefixMark = ""
      trimAmount = amount
      if isNaN(parseInt(amount.charAt(0)))
        prefixMark = amount.substring(0, 1)
        trimAmount = amount.substring(1)

      if isNaN(parseInt(trimAmount))
        return amount
      else
        ret = ""
        cursor = len - 1
        count = 0

        while cursor >= 0
          ret = trimAmount.charAt(cursor) + ret
          if count % 3 == 2
            ret = ',' + ret
          cursor--
          count++

        if ret.charAt(0) == ','
          ret = ret.substring(1)

        ret = prefixMark + ret
        return ret

    else
      return amount

  _isPositive: (amount) ->
    if typeof amount == 'string' and amount != null and amount.length > 0 and amount.charAt(0) == '-'
      return false
    return true