class Tapp.Routers.Campaigns extends Backbone.Router
  routes:
    "campaigns": "index"
    "campaigns/new": "new"

  initialize: ->
    @layout = new Tapp.Views.CampaignsLayout()
    @campaigns = new Tapp.Collections.Campaigns()
    @brands = new Tapp.Collections.Brands()
    @companies = new Tapp.Collections.Companies()
    @companies.fetch()
    @campaigns.fetch()
    @brands.fetch()

  index: ->
    @brandsSidebarView = new Tapp.Views.BrandsSidebar(collection: @brands)
    #    @companiesSidebarView = new Tapp.Views.CompaniesSidebar()
    @campaignsIndexView = new Tapp.Views.CampaignsIndex(collection: @campaigns, brands: @brands)

  new: ->
    @newCampaignView = new Tapp.Views.CampaignsNew(el: $(".content"), brands: @brands, collection: @campaigns)
    @newCampaignView.render()
