React = require 'react'
Utils = require './utils'
$ = require 'jquery'

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
    minHeight = Math.max(@MIN_HEIGHT, $('.results').outerHeight())
    @setState
      height: minHeight
    , =>
      @props.resize()
      if textarea.value is ''
        @setState
          height: @MIN_HEIGHT
        , => @props.resize()
      else if scrollHeight > @state.height
        @setState
          height: textarea.scrollHeight + 2
        , => @props.resize()

  render: ->
    <textarea
      value={@props.value}
      onChange={@onChange}
      ref="textarea"
      style={height: @state.height}
      placeholder="Paste original measurements here"
    />
