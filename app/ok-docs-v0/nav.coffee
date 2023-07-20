define 'ok-docs-v0/nav', [ 'cs!app' ], ( App ) ->
  'use strict'

  { $, _ } = App.lib

  # Router = App.router.Base = App.Backbone.Router.extend
  # class Nav:
    #constructor: -> #@router = new App.router.Base()

# TODO: update +sf hnav to use events, and get/set title as well
  OkDocsNav:
    includes:
      ready: [
        'init_nav_title',
      ]

    init_nav_title: ->
      $('h1.title').text "OK Docs"
      $('h2.title').text "loading..."
#
