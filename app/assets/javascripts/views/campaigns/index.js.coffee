class Tapp.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  events:
    "click .delete-campaign": "deleteCampaign"

  render: ->
    @$el.html(@template(campaigns: @collection.models))
    @$el.find("ul.c-list").on "mouseenter", "li", @toggleControls
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this

  toggleControls: ->
    $(this).find(".cell-bottom").slideDown("fast")
    $(this).on "mouseleave", ->
      $(this).find(".cell-bottom").slideUp("fast")

  deleteCampaign: (e) ->
    e.preventDefault()
    campaignId = $(e.target).data("campaign_id")
    @campaign = @collection.get campaignId
    @campaign.destroy success: (model, response) ->
      $("#flashes").text("Campaign has been deleted!")
