React = require 'react'

module.exports = React.createClass
  getInitialState: ->
    height: 200

  onChange: (e) ->
    @props.onChange(e)
    textarea = e.target
    scrollHeight = textarea.scrollHeight
    console.log scrollHeight
    if scrollHeight > @state.height
      @setState
        height: textarea.scrollHeight

  render: ->
    <textarea
      value={@props.value}
      onChange={@onChange}
      ref="textarea"
      style={height: @state.height}
    />
