class Tapp.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  render: =>
    @$el.html(@template(campaigns: @collection.models))
    @

  initialize: ->
    @setElement $(".content")
    @collection = @options.collection
    @render()
