React = require 'react'
module.exports = React.createClass
  getInitialState: ->
    recipe_x: '9'
    recipe_y: '13'
    my_x: ''
    my_y: ''

  calculateFactor: ->
     (parseFloat(@state.my_x) * parseFloat(@state.my_y)) / (parseFloat(@state.recipe_x) * parseFloat(@state.recipe_y))

  handleChange: (e) ->
    state = {}
    state[e.target.id] = e.target.value
    @setState state, ->
      if @allSet()
        @props.changeFactor(@calculateFactor())

  allSet: ->
    @state.recipe_x != '' and @state.recipe_y != '' and @state.my_x != '' and @state.my_y != ''

  render: ->
    <div>
      <h4>Recipe pan size:</h4>
      <input type="text" value={@state.recipe_x} (
        id="recipe_x"
        onChange={@handleChange}
      /> x <input type="text" value={@state.recipe_y}
        onChange={@handleChange}
        id="recipe_y"
      />
      <h4>My pan size:</h4>
      <input type="text" value={@state.my_x} (
        id="my_x"
        onChange={@handleChange}
      /> x <input type="text" value={@state.my_y}
        onChange={@handleChange}
        id="my_y"
      />
    </div>
