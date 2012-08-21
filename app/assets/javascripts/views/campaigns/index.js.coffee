class Tapp.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  render: ->
    @$el.html(@template(campaigns: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this
