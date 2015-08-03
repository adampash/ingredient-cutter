React = require 'react'
module.exports = React.createClass
  handleClick: (e) ->
    @props.changeFactor(@props.factor)

  render: ->
    activeClass = if parseFloat(@props.factor) == @props.activeFactor then "active" else ""
    <div className="num_container">
      <div
        className={"amount #{activeClass}"}
        onClick={@handleClick}>{@props.display}</div>
    </div>
