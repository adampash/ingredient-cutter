require '../../public/main.css'
React = require 'react'
Ingredient = require './ingredient'
Tabs = require './tabs'
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

App = React.createClass
  getInitialState: ->
    ingredientInput: ''
    ingredients: []
    factor: 1
    factorType: 'divide'

  changeFactorType: (e) ->
    @setState
      factorType: e.target.id

  changeFactor: (e) ->
    @setState
      factor: parseFloat(e)

  handleChange: (e) ->
    @setState
      ingredientInput: e.target.value
    if e.target.value.indexOf("\n") != -1
      ingredients = e.target.value.split(/\n/)
      @setState
        ingredients: ingredients.concat @state.ingredients
        ingredientInput: ''
      console.log 'create a new ingredient'

  render: ->
    ingredients = @state.ingredients.map (ingredient, index) =>
      <Ingredient
        data={ingredient}
        factor={@state.factor}
        key={index}
      />
    <div>
      <Tabs active={@state.factorType} handleClick={@changeFactorType}
        changeFactor={@changeFactor}
        factor={@state.factor}
      />
      <h4>Paste your ingredients here (more than one at a time is fine)</h4>
      <textarea value={@state.ingredientInput} onChange={@handleChange} rows="1" />
      <h4>{
        @state.factor != 1 and "Here are you new ingredient measurements:"
      }</h4>
      {ingredients}
    </div>


React.render <App/>, document.body
