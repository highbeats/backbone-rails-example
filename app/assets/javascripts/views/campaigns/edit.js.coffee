class Tapp.Views.CampaignsEdit extends Backbone.View

  template: JST['campaigns/edit']

  events: 
    "click #update_campaign": "updateCampaign"
    "click a:contains('Edit countries and languages)": "toggleCountrySettings"
  render: ->
    @$el.html(@template(brands: @brands.models, campaign: @model))
    @

  initialize: ->
    @brands = @options.brands
    @model = @options.model
    @router = @options.router

  toggleCountrySettings: ->

  updateCampaign: (e) ->
    e.preventDefault()
    form = $("form")
    attributes = ViewsHelpers.processInputs form
    @model.save attributes, success: (model, response) =>
      @router.navigate "#campaigns", trigger: true
