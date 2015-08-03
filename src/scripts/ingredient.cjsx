React = require 'react'
_ = require 'underscore'
Utils = require './utils'

module.exports = React.createClass
  componentDidMount: ->
    @props.resize()

  translateIngredients: ->
    string = Utils.replaceUnicode(@props.data)
    string = Utils.convertStrings(string)
    [nums, string] = Utils.getAmounts(string)
    if nums?
      for num in nums
        num = parseFloat num
        newNum = num * @props.factor
        numString = Utils.float2rat(newNum)
        string = string.replace("REPLACE:#{num.toString()}", numString)
        # console.log "NUM: ", num, "NUMSTRING: ", numString, "STRING: ", string
    string

  render: ->
    <div>
      {@translateIngredients()}
    </div>
