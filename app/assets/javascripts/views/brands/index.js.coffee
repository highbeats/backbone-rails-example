class Tapp.Views.BrandsIndex extends Backbone.View

  template: JST['brands/index']

  render: =>
    @$el.html(@template(brands: @collection.models))
    @

  initialize: ->
    @setElement $(".sidebar")
    @collection = @options.collection
    @render()
