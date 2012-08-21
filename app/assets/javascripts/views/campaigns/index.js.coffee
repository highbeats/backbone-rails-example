class Tapp.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  events:
    "click .delete-campaign": "deleteCampaign"

  render: ->
    @$el.html(@template(campaigns: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this

  deleteCampaign: (e) ->
    e.preventDefault()
    campaignId = $(e.target).data("campaign_id")
    @campaign = @collection.get campaignId
    @campaign.destroy success: (model, response) ->
      alert "Campaign has been deleted!"
