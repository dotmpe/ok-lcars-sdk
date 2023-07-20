define 'ok-docs-v0/util/FaderTween', [
  'cs!app'
  #"color-tween"
  "/npm/packages/color-tween/dist/color-tween.js"
], ( App, ColorTween ) ->

  { $, _ } = App.lib

  class FaderTween

    constructor: ( @pill, @c1, @c2, @e1, @e2, @duration=1, @pause=1, @pause2=0 ) ->
      if not @pause2 then @pause2 = @pause
      @start()

    _update1: ->
      if @tweenIn.update()
        requestAnimationFrame _.bind @_update1, @

    _update2: ->
      if @tweenOut.update()
        requestAnimationFrame _.bind @_update2, @

    setColor: (color)->
      @pill.css('background-color', color.hex())

    _primeIn: ->
      self = @
      @tweenIn = new ColorTween(@c1, @c2)
        .onUpdate(_.bind @setColor, @)
        .duration(@duration/2)
        .easing(@e1)
        .onEnd ->
          setTimeout ->
            self.tweenOut.start _.bind self._update2, self
          , self.pause2

    _primeOut: ->
      self = @
      @tweenOut = new ColorTween(@c2, @c1)
        .onUpdate(_.bind @setColor, @)
        .duration(@duration/2)
        .easing(@e2)
        .onEnd ->
          setTimeout ->
            self.tweenIn.start _.bind self._update1, self
          , self.pause

    start: ->
      @_primeOut()
      @_primeIn()
      @tweenIn.start _.bind @_update1, @
