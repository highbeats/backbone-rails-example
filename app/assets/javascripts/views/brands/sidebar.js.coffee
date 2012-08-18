class Tapp.Views.BrandsSidebar extends Backbone.View

  el: $(".sidebar")
  template: JST['brands/sidebar']

  render: =>
    @$el.html(@template(brands: @collection.models))
    @


  initialize: ->
    @setElement $(".sidebar")
    @collection = @options.collection
    @render()
