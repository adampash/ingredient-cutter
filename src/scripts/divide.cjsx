React = require 'react'
Pair = require './pair'

module.exports = React.createClass
  render: ->
    <div>
      <h4>Divide recipe by</h4>
      <div className="tabs svgs">
        <Pair
          factor={@props.factor}
          changeFactor={@props.changeFactor}
          amount="0.5"
          display="Half"
          svg="half"
        />
        <Pair
          factor={@props.factor}
          changeFactor={@props.changeFactor}
          amount="0.3333333333333333"
          display="A Third"
          svg="third"
        />
        <Pair
          factor={@props.factor}
          changeFactor={@props.changeFactor}
          amount="0.25"
          display="A Quarter"
          svg="quarter"
        />
        <Pair
          factor={@props.factor}
          changeFactor={@props.changeFactor}
          amount="0.125"
          display="An Eighth"
          svg="eighth"
        />
      </div>
    </div>
