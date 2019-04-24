define 'ok-docs-v0/mixin.okudagram-follies', [

  'jquery'

], ( $ ) ->


  OkudagramFollies:
    includes:
      ready: [
        'init_faux_buttons',
        'init_scrolling_numbers'
      ]

    init_faux_buttons: ( path = window.location.href, self=@ ) ->
      placeholder = $('#ok-faux-buttons-folly')
      if (placeholder.length)
        console.log 'init_faux_buttons'
      else
        console.log 'No placeholder for OkudagramFollies.init_faux_buttons'

      node = $('[data-label="11-47"]')
      console.log node
      tween = null
      setNode = (color)->
        node.css('background-color', color.hex())
      animate = ->
        if tween.update()
          setTimeout animate, 50
      tween = new ColorTween('#fce94f', '#ce5c00')
        .onUpdate(setNode)
        .start(animate)

    init_scrolling_numbers: ( path = window.location.href, self=@ ) ->
      @ok_rndnum_scroll = $('#ok-rndnum-scroll-folly')
      if not @ok_rndnum_scroll.length
        console.warn 'No placeholder for OkudagramFollies.init_scrolling_numbers'
        return

      @ok_rndnum_scroll.empty()
      @cols = []
      @col_timers = []
      @init_rndnum_scroll_col()
      @init_rndnum_scroll_col()
      @init_rndnum_scroll_col()

      console.log 'Initialized scrolling-numbers OkudagramFolly'

    init_rndnum_scroll_col: ->
      @add_rndnum_scroll_col()
      self = @
      cb = (ci) ->
        self.add_rndnum_scroll_row ci
        reset ci
      reset = (ci) ->
        timeout = 1000 * Math.random()
        self.col_timers[ci] = window.setTimeout $.proxy(cb, self), timeout, ci

      reset @cols.length-1

    add_rndnum_scroll_col: ->
      i = @cols.length
      @cols[i] = $ '<div class="content flexcv"></div>'
      @ok_rndnum_scroll.append  @cols[i]

    add_rndnum_scroll_row: ( ci )->
      if @cols[ci].find('div.text').length > 5
        @cols[ci].empty()
      rndnum = Math.random().toString()
      newrow = $ '<div class="text text-1-1"></div>'
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

