define 'ok-docs-v0/mixins', [

  #'cs!sitefile/mixin.breadcrumb',
  #'cs!sitefile/mixin.du-page',
  #'cs!sitefile/mixin.last-modified',
  'cs!sitefile/mixin.hyper-nav',
  'cs!ok-docs-v0/mixin.okudagram-follies'

], (
  #{ DocumentBreadcrumb },
  #{ DocutilsPage },
  #{ DocumentLastModified },
  { HNavDocument },
  { OkudagramFollies_1 }
) ->

  all: ( klass ) ->
    #klass.include DocutilsPage
    #klass.include DocumentLastModified
    #klass.include DocumentBreadcrumb
    klass.include HNavDocument
    klass.include OkudagramFollies_1
