class Tapp.Models.Brand extends Backbone.Model
  paramsRoot: "brand"

  defaults:
    id: null
    name: null
    company_id: null
    company: null

  company: =>
    url = "companies/#{@get('company_id')}"
    @company = new Tapp.Models.Company()
    @company.fetch(url: url)

  checkCampaignsInProgress: (collection) =>
    inProgress = []
    _.each collection.models, (campaign, i) =>
      inProgress.push(campaign) if campaign.get("brand_id") is @get("id")
    inProgress

  initialize: ->
    @company() if @get("company_id")?
