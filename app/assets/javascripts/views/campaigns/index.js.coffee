class Tapp.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  events:
    "click .campaign-item": "editCampaign"

  render: ->
    @$el.html(@template(campaigns: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this

  editCampaign: (e) ->
    console.log(e.target)
    campaignId = $(e.target).data "campaign_id"
    @router.navigate "campaigns/#{campaignId}/edit", trigger: true
