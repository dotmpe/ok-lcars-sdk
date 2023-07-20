# Use some client modules shipped with Node-Sitefile to setup a client
# that loads our OK app
define 'ok-docs-v0/app', [

  'cs!app'
  'event-signal'
  'cs!sf-v0/component'
  'cs!sf-v0/mixin.page'
  'cs!./nav'
  'cs!sf-v0/meta/nav'
  'cs!sf-v0/component/client-modules'

], ( App, EventSignal, Component, { Page }, Nav, NavMeta,
ClientModules ) ->

  console.log 'OK! Docs v0 app', App
  
  { $, _ } = App.lib

  # The metadata must be provided in DOM elements *before* the script.
  #apps = $('meta[name=sitefile-apps]').attr('content').split(',')

  class OkDocsApp extends Component
    constructor: ->
      super()
      @events = new EventSignal()
      for app of App.init
        App.init[app]()

    run: -> # XXX:
      console.log 'Starting ok-docs-v0 nav..'
      @nav = new Nav()
      new NavMeta().discover()


  OkDocsApp.include Page

  new ClientModules().start()

  App.main = new OkDocsApp()

  App.main
