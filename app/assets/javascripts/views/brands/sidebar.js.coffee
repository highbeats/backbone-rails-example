class Tapp.Views.BrandsSidebar extends Backbone.View

  template: JST['brands/sidebar']

  render: ->
    @$el.html(@template(brands: @collection.models))
    @


  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, this
    @render()
