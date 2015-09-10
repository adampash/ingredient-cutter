React = require 'react'
Pan = require './pan'

module.exports = React.createClass
  getInitialState: ->
    recipe_x: '9'
    recipe_y: '13'
    my_x: '8'
    my_y: '8'
    activePan: null
    circle: 130
    square: 120
    margin: 20
    one: ''
    two: ''

  changeArea: (pan, num) ->
    obj = {}
    obj[pan] = num
    @setState obj, =>
      if @allset()
        @props.changeFactor(@calculateFactor())

  allset: ->
    @state.one != '' and @state.two != ''


  calculateFactor: ->
    parseFloat(@state.two / @state.one)

  render: ->
    <div className="pans">
      <h4>Pick Shape & Pan Size</h4>
      <div className="pans_container">
        <Pan num={1} changeArea={@changeArea} />
        <Pan num={2} changeArea={@changeArea} />
      </div>
    </div>
