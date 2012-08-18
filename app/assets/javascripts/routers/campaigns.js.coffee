class Tapp.Routers.Campaigns extends Backbone.Router
  routes:
    "campaigns": "campaignsIndex"
    "campaigns/new": "newCampaign"

  initialize: ->
    @layout = new Tapp.Views.CampaignsLayout
    @campaigns = new Tapp.Collections.Campaigns()
    @brands = new Tapp.Collections.Brands()
    @campaigns.fetch()
    @brands.fetch()

  campaignsIndex: ->
    @layout.render()
    @brandsSidebarView = new Tapp.Views.BrandsSidebar(collection: @brands)
    @campaignsIndexView = new Tapp.Views.CampaignsIndex(collection: @campaigns)

  campaignNew: ->

