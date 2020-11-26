define 'ok-docs-v0/mixin.okudagram-follies', [

  'jquery'

], ( $ ) ->


  OkudagramFollies_1:
    includes:
      ready: [
        'init_blinking',
        'init_scrolling_numbers'
      ]

    init_blinking: ( path = window.location.href, self=@ ) ->
      # TODO: OkudagramFollies-1 blinking buttons
      #node = $('[data-label="11-47"]')
      #tween = null
      #setNode = (color)->
      #  node.css('background-color', color.hex())
      #animate = ->
      #  if tween.update()
      #    setTimeout animate, 50
      #tween = new ColorTween('#fce94f', '#ce5c00')
      #  .onUpdate(setNode)
      #  .start(animate)

    init_scrolling_numbers: ( path = window.location.href, self=@ ) ->
      @ok_rndnum_scroll = $('#ok-rndnum-scroll-folly')
      if not @ok_rndnum_scroll.length
        console.warn 'No placeholder for OkudagramFollies.init_scrolling_numbers'
        return

      @ok_rndnum_scroll.empty()
      @cols = []
      @col_timers = []

      for i in [ 1 ... 8 ]
        @init_rndnum_scroll_col()

      console.log 'Initialized scrolling-numbers OkudagramFolly'

    rndnum_colors: [
      'text-0-0'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-1'
      'text-1-2'
      'text-1-3'
      'text-5-3'
    ]

    rndnum_random_color: ->
      idx = Math.floor( Math.random() * @rndnum_colors.length )
      @rndnum_colors[ idx ]

    init_rndnum_scroll_col: ->
      @add_rndnum_scroll_col()
      self = @
      cb = (ci) ->
        c = self.rndnum_random_color()
        self.add_rndnum_scroll_row ci, 4*Math.random(), 8, c
        reset ci
      reset = (ci) ->
        timeout = 1000 * Math.random()
        self.col_timers[ci] = window.setTimeout $.proxy(cb, self), timeout, ci
      l = @cols.length-1
      reset l
      @cols[l].attr 'title', 'click to toggle animation'
      @cols[l].click ( evt )->
        console.log l, self.col_timers[l]
        if typeof self.col_timers[l] is "undefined"
          console.log 'reset', l
          reset l
        else
          window.clearTimeout self.col_timers[l]
          delete self.col_timers[l]

    add_rndnum_scroll_col: ->
      i = @cols.length
      @cols[i] = $ '<div class="content flexcv"></div>'
      @ok_rndnum_scroll.append  @cols[i]

    add_rndnum_scroll_row: ( ci, mindigits=1, maxdigits=8, color='text-1-1' )->
      if @cols[ci].find('small.text').length > 4
        @cols[ci].empty()
      rndnum = ''
      while rndnum.length < mindigits
        rndnum = Math.round( Math.random() * Math.pow 10, Math.round (maxdigits) * Math.random() ).toString()
      newrow = $ "<small class=\"text #{color}\"><small>"
      newrow.append(rndnum)
      @cols[ci].append newrow
      #@tween_rndnum_scroll_row ci, @cols[ci].length-1

    tween_rndnum_scroll_row: ( ci, ri ) ->
      tween = null
      setNode = (color)->
        console.log ci, ri, color.hex()
        #@cols[ci][ri].css('color', color.hex())
      animate = ->
        if tween.update()
          setTimeout animate, 50
      tween = new ColorTween('#fce94f', '#ce5c00')
        .onUpdate(setNode)
        .start(animate)

#
