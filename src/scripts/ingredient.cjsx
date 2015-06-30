React = require 'react'
_ = require 'underscore'
Utils = require './utils'

module.exports = React.createClass
  translateIngredients: ->
    string = Utils.replaceUnicode(@props.data)
    string = Utils.convertStrings(string)
    nums = Utils.getAmounts(string)
    if nums?
      for num in nums
        num = parseFloat num
        newNum = num * @props.factor
        numString = Utils.float2rat(newNum)
        string = string.replace(num.toString(), numString)
    string

  render: ->
    <div>
      {@translateIngredients()}
    </div>
