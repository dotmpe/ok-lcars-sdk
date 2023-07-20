###
Boilerplate context for all web Apps in OK-LCARS-SDK.
###
define 'app', [
  
  'jquery'
  'lodash'
  'underscore'

], ( $, Lodash, Underscore ) ->
  'use strict'
  {
    #Common: Common
    lib:
      $: $
      _: Lodash
      __: Underscore
    router:
      routes: {}
      proto: {}
    view: {}
    init: {}
    collection: null
    model:
      proto: {}
  }
