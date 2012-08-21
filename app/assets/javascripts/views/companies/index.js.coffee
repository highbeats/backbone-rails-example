class Tapp.Views.CompaniesIndex extends Backbone.View

  template: JST['companies/index']

  render: =>
    @$el.html(@template(companies: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, this
