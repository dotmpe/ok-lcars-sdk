define 'ok-docs-v0/mixin.okudagram-follies', [

  'cs!app'
  'cs!ok-docs-v0/util/FaderTween'

  "css!/ok-docs.css"

], ( App, FaderTween ) ->

  { $, _ } = App.lib

  OkudagramFollies_1:
    includes:
      ready: [
        'init_ctl',
        'init_blinking',
        'init_scrolling_numbers'
      ]

    init_blinking: ( path = window.location.href, self=@ ) ->
      # TODO: OkudagramFollies-1 blinking buttons

      @tweens = []

      @tweens.push new FaderTween $('.cts'), '#a40000', '#ef2929',
                                   'cubicIn', 'cubicOut', 400, 1800, 200

      @tweens.push new FaderTween $('.dtr'), '#729fcf', '#204a87',
                                   'linear', 'linear', 900, 1400, 100

    init_scrolling_numbers: ( path = window.location.href, self=@ ) ->
      @ok_rndnum_scroll = $('#ok-rndnum-scroll-folly')
      if not @ok_rndnum_scroll.length
        console.warn 'No placeholder for OkudagramFollies.init_scrolling_numbers'
        return

      @ok_rndnum_scroll.empty()
      @cols = []
      @col_timers = []

      # Determine sizes mostly from parents parent, ie .f13-1-2-1 cell
      # and its direct div descendant.

      cell = @ok_rndnum_scroll.parents('.f13-1-2-1')

      titleW = Math.max(cell.find('h1.title').innerWidth(),
                        cell.find('h2.title').innerWidth(),
                        cell.find('div.buttons').innerWidth())

      # XXX: inline-block to make measurable, then make normal block to flow
      # better
      cell.find('h2.title').css 'display', 'block'

      cellHm = parseInt(@ok_rndnum_scroll.css('margin-left'))\
              +parseInt(@ok_rndnum_scroll.css('margin-right'))
      cellHp = parseInt(cell.css('padding-left'))\
               +parseInt(cell.css('padding-right'))
      cellW = cell.children('div').innerWidth() - titleW - cellHm - cellHp

      # for the height and other measures use hardcoded values
      # FIXME: should do $ "<div class="column"/>" .css # "top-margin"
      cellH = cell.innerHeight() - 64 # 2*32px for the 21pt top-margin on cols
                                      # and leaving the space same below

      columns = Math.floor(cellW/101.328)
      for i in [ 0 ... columns ]
        @init_rndnum_scroll_col(Math.floor(cellH/38))

      ## Distribute remaining space as additional margin between columns
      space = ( cellW % 101.328 ) / (columns-1)
      for i in [ 0 ... (columns-1) ]
        @cols[i].css "margin-left", "#{space}px"

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

    init_rndnum_scroll_col: ( rows=6 ) ->
      @add_rndnum_scroll_col()
      self = @
      cb = (ci) ->
        c = self.rndnum_random_color()
        self.add_rndnum_scroll_row ci, rows, 4*Math.random(), 8, c
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
      @cols[i] = $ '<div class="content flexcv column'+i+'"></div>'
      @ok_rndnum_scroll.append  @cols[i]

    add_rndnum_scroll_row: ( ci, rows=6, mindigits=1, maxdigits=8, color='text-1-1' )->
      if @cols[ci].find('small.text').length == rows
        # Clear if we find a full column
        @cols[ci].empty()
      rndnum = ''
      while rndnum.length < mindigits
        rndnum = Math.round( Math.random() * Math.pow 10, Math.round (maxdigits) * Math.random() ).toString()
      newrow = $ "<small class=\"text #{color}\"><small>"
      newrow.append(rndnum)
      @cols[ci].append newrow

      # XXX: cleanup
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

# XXX: controls should be part of app window, and not here
    init_ctl: ->

      #$('span.ok-dia__span__pill:contains("FLSCR")')
      @flscrn = $('.fullscreen-toggle')
      @flscrn.click @ctl_fullscreen_toggle_evt

      $('.scroll-to-top').click @ctl_scroll_top
      $('.scroll-to-bottom').click @ctl_scroll_bottom

    ctl_fullscreen_toggle_evt: ->
      #document.getElementsByTagName('body')[0].requestFullscreen()

      console.log $('body')[0].fullScreenElement, document.webkitIsFullScreen

      if document.fullScreenElement && null != document.fullScreenElement || !document.mozFullScreen && !document.webkitIsFullScreen
        $('body')[0].requestFullscreen()
      else
        document.webkitCancelFullScreen()

#  document.fullScreenElement && null !== document.fullScreenElement ||
#  !document.mozFullScreen && !document.webkitIsFullScreen ?
#  document.documentElement.requestFullScreen ?
#  document.documentElement.requestFullScreen() :
#  document.documentElement.mozRequestFullScreen ?
#  document.documentElement.mozRequestFullScreen() :
#  document.documentElement.webkitRequestFullScreen &&
#  document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT)
#  : document.cancelFullScreen ? document.cancelFullScreen() :
#  document.mozCancelFullScreen ? document.mozCancelFullScreen() :
#  document.webkitCancelFullScreen && document.webkitCancelFullScreen()

    ctl_scroll_top: ->
      el = $('.f13-2-2-2.content')
      el.animate {scrollTop: 0}, 1000

    ctl_scroll_bottom: ->
      el = $('.f13-2-2-2.content')
      el.animate {scrollTop: el.get(0).scrollHeight}, 1000

#
