class Tapp.Routers.Campaigns extends Backbone.Router
  routes:
    "campaigns": "index"
    "campaigns/new": "new"
    "campaigns/:id/edit": "edit"

  initialize: ->
    @layout = new Tapp.Views.CampaignsLayout()

    @campaigns = new Tapp.Collections.Campaigns()
    @brands = new Tapp.Collections.Brands()
    @companies = new Tapp.Collections.Companies()

    @companies.fetch()
    @campaigns.fetch()
    @brands.fetch()

  index: ->
    @campaignsIndexView = new Tapp.Views.CampaignsIndex(el: $(".content"), collection: @campaigns, router: @)
    @campaignsIndexView.render()

  new: ->
    @newCampaignView = new Tapp.Views.CampaignsNew(el: $(".content"), brands: @brands, collection: @campaigns, router: @)
    @newCampaignView.render()

  edit: (id) ->
    @campaign = @campaigns.get(id)
    @editCampaignView = new Tapp.Views.CampaignsEdit(el: $(".content"), model: @campaign, brands: @brands, router: @)
    @editCampaignView.render()
