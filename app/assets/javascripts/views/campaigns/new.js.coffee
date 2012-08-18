class Tapp.Views.CampaignsNew extends Backbone.View

  template: JST['campaigns/new']

  events:
    "click #save_campaign": "saveCampaign"

  render: =>
    @$el.htm(@template())

  initialize: ->
    @setElement $(".content")
    @render()
