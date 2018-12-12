define 'ok-docs-v0/nav', [ 'cs!app' ], ( App ) ->
  'use strict'

  { $, _ } = App.lib

  # Router = App.router.Base = App.Backbone.Router.extend
  class Nav
    constructor: ->
      #@router = new App.router.Base()
