class Tapp.Views.BrandsIndex extends Backbone.View

  template: JST['brands/index']

  render: ->
    @$el.html(@template(brands: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this
