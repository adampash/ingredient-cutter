React = require 'react'
Utils = require './utils'

module.exports = React.createClass
  MIN_HEIGHT: 100
  getInitialState: ->
    height: @MIN_HEIGHT

  onChange: (e) ->
    text = e.target.value
    if text != ''
      text = Utils.replaceUnicode(text)
    @props.onChange(text)
    textarea = e.target
    scrollHeight = textarea.scrollHeight
    if textarea.value is ''
      @setState
        height: @MIN_HEIGHT
    else if scrollHeight > @state.height
      @setState
        height: textarea.scrollHeight

  render: ->
    <textarea
      value={@props.value}
      onChange={@onChange}
      ref="textarea"
      style={height: @state.height}
      placeholder="Paste original measurements here"
    />
