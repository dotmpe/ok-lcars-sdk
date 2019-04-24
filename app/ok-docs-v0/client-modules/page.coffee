define 'ok-docs-v0/client-modules/page', [

  'cs!sitefile/component'
  'cs!ok-docs-v0/mixins'

  #'crossroads', # Unused dependency for client-side routing
  #'hasher', # access to hash-location navigation triggers/events
  #'jquery-ui', # unused jQuery widgets dep
  #'cookies-js' # initial try at persisting data per client

], ( Component, mixins ) ->

  console.log 'OK! Docs v0 cm:page'


  class OkDocsPage extends Component

    constructor: ( @app, @container=$('body'), @options = {} ) ->
      super()
      self = @
      # Setup to initialize page once all coponents are initialized
      @app.events.ready.addListener ( evt ) ->
        if evt.name == 'all'
            self.okdocs()
      @app.events.ready.emit name: 'ok-docs-page'

    okdocs: ->
      # Clear loading indicator label
      $('.ok-lcars-doc').text('')
      @init_hnav_router()
      console.log 'OkDocsPage ready'


  mixins.all OkDocsPage


  OkDocsPage: OkDocsPage
  init_client_module: ( ready_cb, loader ) ->

    page = new OkDocsPage loader, $('body'), {}
    page.app.events.ready.addListener ( evt ) ->
        if evt.name == 'all'
            ready_cb( page )

    page
