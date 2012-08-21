class Tapp.Views.CampaignsEdit extends Backbone.View

  template: JST['campaigns/edit']

  events: 
    "click #update_campaign": "updateCampaign"

  render: ->
    @$el.html(@template(brands: @brands.models, campaign: @model))
    @

  initialize: ->
    @brands = @options.brands
    @model = @options.model
    @router = @options.router



  updateCampaign: ->
    
