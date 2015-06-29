React = require 'react'

Isvg = require 'react-inlinesvg'
Factor = require './factor'

module.exports = React.createClass
  handleClick: (e) ->
    @props.changeFactor(@props.amount)

  render: ->
    <div
      className={"pair #{'active' if @props.factor is parseFloat(@props.amount)}"}
      onClick={@handleClick}
    >
      <Isvg src={"#{@props.svg}.svg"} />
      <Factor factor={@props.amount} activeFactor={@props.factor} display={@props.display} changeFactor={@props.changeFactor} />
    </div>
