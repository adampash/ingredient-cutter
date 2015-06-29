React = require 'react'
Factor = require './factor'
Pan = require './pan'
Divide = require './divide'

module.exports = React.createClass
  render: ->
    <div>
      <h4>I want to</h4>
      <div className="tabs">
        <div
          className={"option " + if @props.active is "divide" then "active" else ""}
          id="divide"
          onClick={@props.handleClick}
        >
          Divide Recipe
        </div>
        <div
          className={"option " + if @props.active is "multiply" then "active" else ""}
          id="multiply"
          onClick={@props.handleClick}
        >
          Multiply Recipe
        </div>
        <div
          className={"option " + if @props.active is "pan" then "active" else ""}
          id="pan"
          onClick={@props.handleClick}
        >
          Change Pan Size
        </div>
      </div>
      {
        if @props.active is "pan"
          <Pan changeFactor={@props.changeFactor} changeFactor={@props.changeFactor} />
        else if @props.active is "divide"
          <Divide changeFactor={@props.changeFactor} factor={@props.factor} />
        else if @props.active is "multiply"
          <div>
            <h4>Multiply recipe by</h4>
            <div className="tabs">
              <Factor factor="1.5" activeFactor={@props.factor} display="1.5" changeFactor={@props.changeFactor} />
              <Factor factor="2" activeFactor={@props.factor} display="2" changeFactor={@props.changeFactor} />
              <Factor factor="3" activeFactor={@props.factor} display="3" changeFactor={@props.changeFactor} />
              <Factor factor="4" activeFactor={@props.factor} display="4" changeFactor={@props.changeFactor} />
              <Factor factor="5" activeFactor={@props.factor} display="5" changeFactor={@props.changeFactor} />
              <Factor factor="6" activeFactor={@props.factor} display="6" changeFactor={@props.changeFactor} />
              <Factor factor="7" activeFactor={@props.factor} display="7" changeFactor={@props.changeFactor} />
              <Factor factor="8" activeFactor={@props.factor} display="8" changeFactor={@props.changeFactor} />
            </div>
          </div>
      }
    </div>
