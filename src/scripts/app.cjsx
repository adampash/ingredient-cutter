require '../../public/main.css'
React = require 'react'
Ingredient = require './ingredient'
Tabs = require './tabs'
Print = require './print'
ResizingTextarea = require './resizing_textarea'
$ = require 'jquery'
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

App = React.createClass
  getInitialState: ->
    ingredientInput: ''
    ingredients: []
    factor: 0.5
    factorType: 'divide'

  changeFactorType: (e) ->
    @setState
      factorType: e.target.id
    @resize()

  componentDidMount: ->
    @resize()
    window.addEventListener 'resize', @resize

  componentWillUnmount: ->
    window.removeEventListener 'resize', @resize

  resize: ->
    height = $('body').outerHeight() + 20
    # console.log height
    window.top.postMessage(
      JSON.stringify(
        kinja:
          sourceUrl: window.location.href
          resizeFrame:
            height: height
      ), '*'
    )

  changeFactor: (e) ->
    @setState
      factor: parseFloat(e)

  handleChange: (ingredientInput) ->
    @setState
      ingredientInput: ingredientInput
    ingredients = ingredientInput.split(/\n/)
    @setState
      ingredients: ingredients

  render: ->
    ingredients = @state.ingredients.map (ingredient, index) =>
      <Ingredient
        data={ingredient}
        factor={@state.factor}
        key={index}
        resize={@resize}
      />
    <div>
      <h3 className="interactive">Interactive</h3>
      <Tabs active={@state.factorType} handleClick={@changeFactorType}
        changeFactor={@changeFactor}
        factor={@state.factor}
        resize={@resize}
      />
      <h4>Ingredients</h4>
      <div className="ingredients">
        <div className="list">
          <h5>Recipe Measurements</h5>
          <ResizingTextarea value={@state.ingredientInput}
            onChange={@handleChange}
            resize={@resize}
          />
        </div>
        <div className="list">
          <h5>
            Your New Measurements
            <span className="hide_mobile"> (<Print />)</span>
          </h5>
          <div className="results">
            {ingredients}
          </div>
        </div>
      </div>
    </div>


React.render <App/>, document.body
