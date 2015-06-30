React = require 'react'
_ = require 'underscore'

module.exports = React.createClass
  getAmounts: (string) ->
    nums = string.match(/\d+\.?\d*/g)

  replaceUnicode: ->
    string = @props.data
    _.mapObject @vulgar_to_float, (value, key) ->
      string = string.replace(key, value)
    string

  convertStrings: (string) ->
    _.mapObject @string_to_float, (value, key) ->
      string = string.replace(key, value)
    string

  decimalToFraction: (string) ->
    _.mapObject @string_to_float, (value, key) ->
      regex = new RegExp(value + " ")
      string = string.replace(regex, "#{key} ")
    string

  float2rat: (x) ->
    # tolerance = 1.0e-6
    if x > 1
      w = parseInt x
      f = x - w
    else
      f = x
    tolerance = 1.0e-1
    h1=1
    h2=0
    k1=0
    k2=1
    b = f
    # TODO separate our whole numbers for fractions like 4/3 to 1 1/3
    while true
      a = Math.floor(b)
      aux = h1
      h1 = a*h1+h2
      h2 = aux
      aux = k1
      k1 = a*k1+k2
      k2 = aux
      b = 1/(b-a)
      break unless (Math.abs(f-h1/k1) > f*tolerance)
    if k1 is 1
      if w?
        "#{w + h1}"
      else
        "#{h1}"
    else
      if w?
        "#{w} #{h1}/#{k1}"
      else
        "#{h1}/#{k1}"

  translateIngredients: ->
    string = @replaceUnicode()
    string = @convertStrings(string)
    nums = @getAmounts(string)
    if nums?
      for num in nums
        num = parseFloat num
        newNum = num * @props.factor
        numString = @float2rat(newNum)
        string = string.replace(num.toString(), numString)
    # @decimalToFraction string
    string

  vulgar_to_float:
    "\u00BC": "1/4"
    "\u00BD": "1/2"
    "\u00BE": "3/4"
    "\u2150": "1/7"
    "\u2151": "1/9"
    "\u2152": "1/10"
    "\u2153": "1/3"
    "\u2154": "2/3"
    "\u2155": "1/5"
    "\u2156": "2/5"
    "\u2157": "3/5"
    "\u2158": "4/5"
    "\u2159": "1/6"
    "\u215A": "5/6"
    "\u215B": "1/8"
    "\u215C": "3/8"
    "\u215D": "5/8"
    "\u215E": "7/8"
    "\u2189": "0/3"

  string_to_float:
    "1/4": 1.0 / 4.0
    "1/2": 1.0 / 2.0
    "3/4": 3.0 / 4.0
    "1/7": 1.0 / 7.0
    "1/9": 1.0 / 9.0
    "1/10": 1.0 / 10.0
    "1/3": 1.0 / 3.0
    "2/3": 2.0 / 3.0
    "1/5": 1.0 / 5.0
    "2/5": 2.0 / 5.0
    "3/5": 3.0 / 5.0
    "4/5": 4.0 / 5.0
    "1/6": 1.0 / 6.0
    "5/6": 5.0 / 6.0
    "1/8": 1.0 / 8.0
    "3/8": 3.0 / 8.0
    "5/8": 5.0 / 8.0
    "7/8": 7.0 / 8.0
    "0/3": 0.0 / 3.0

  render: ->
    <div>
      {@translateIngredients()}
    </div>
