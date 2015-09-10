React = require 'react'
Isvg = require 'react-inlinesvg'
$ = require 'jquery'

module.exports = React.createClass
  getInitialState: ->
    x: '9'
    y: '13'
    activePan: null
    circle: 130
    square: 120
    circle: 55
    square: 50
    margin: 10
    area: null

  # componentDidMount: ->
  #   @sizeShapes()
  #   window.addEventListener 'resize', @sizeShapes

  # componentWillUnmount: ->
  #   window.removeEventListener 'resize', @sizeShapes

  # sizeShapes: ->
  #   half = $('.pans_container').width()/10
  #   circle = Math.round(half * 0.94)
  #   square = Math.round(half * 0.85)
  #   margin = Math.round(half * 0.10)
  #   @setState
  #     circle: Math.min(140, circle)
  #     square: Math.min(130, square)
  #     margin: margin


  setActive: (e) ->
    event = e
    newState = activePan: e.target.id
    @setState newState, =>
      @calculateArea()

  calculateArea: ->
    if @state.activePan is 'rect'
      area = parseFloat(@state.x) * parseFloat(@state.y)
    else
      area = Math.pow(parseFloat(@state.x)/2, 2) * Math.PI
    if @props.num is 1 then num = "one" else num = "two"
    @props.changeArea(num, area)

  handleChange: (e) ->
    state = {}
    if e.target?
      state[e.target.id] = e.target.value
    @setState state, ->
      @calculateArea()

  render: ->
    if @props.num is 1
      title = "Recipe Pan Shape & Size"
    else
      title = "My Pan Shape & Size"
    if @state.activePan is 'round'
      y = @state.recipe_x
    <div className={"pan_container #{"two" if @props.num is 2}"}>
      <h5 className="push">{title}</h5>
      <div className={"pan"}>
        <div className="shapes">
          <div id="rect" style={width: @state.square, height: @state.square, marginRight: @state.margin} className={"rect #{"active" if @state.activePan is "rect"}"}
            onClick={@setActive}
          >
          </div>
          <div id="round" style={width: @state.circle, height: @state.circle} className={"round #{"active" if @state.activePan is "round"}"}
            onClick={@setActive}
          >
          </div>
        </div>
        <div className="size">
          <div className="measurement">
            {
              if @state.activePan is 'rect'
                <div className="container">
                    <input type="text" value={@state.x}
                      id="x" className="original"
                      onChange={@handleChange}
                    />

                  <div className="by">
                    <Isvg src="x.svg" />
                  </div>

                    <input type="text" value={@state.y}
                      onChange={@handleChange} className="original"
                      id="y"
                    />
                </div>
              else
                <div className="container">
                  <input type="text" value={@state.x} (
                    id="x" className="original"
                    onChange={@handleChange}
                  />
                </div>
            }
          </div>
        </div>
      </div>
    </div>
