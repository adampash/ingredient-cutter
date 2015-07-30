React = require 'react'

module.exports = React.createClass
  print: ->
    window.print()

  render: ->
    <span className="print" onClick={@print}>
      Print
    </span>
