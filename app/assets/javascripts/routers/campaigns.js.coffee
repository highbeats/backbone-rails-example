class Tapp.Routers.Campaigns extends Backbone.Router
  routes:
    "campaigns": "index"
    "campaigns/new": "new"
    "campaigns/:id/edit": "edit"

  initialize: ->
    @campaigns = new Tapp.Collections.Campaigns()
    @companies = new Tapp.Collections.Companies()
    @brands = new Tapp.Collections.Brands()
    @brands.fetch()
    @companies.fetch()
    @campaigns.fetch()

  index: ->
    view = new Tapp.Views.CampaignsIndex
      el: $(".content"),
      collection: @campaigns,
      router: @
    view.render()

  new: ->
    @view = new Tapp.Views.CampaignsNew
      el: $(".content"),
      brands: @brands,
      collection: @campaigns,
      router: @
    @view.render()

  edit: (id) ->
    @campaign = @campaigns.get(id)
    view = new Tapp.Views.CampaignsEdit
      el: $(".content"),
      model: @campaign,
      brands: @brands,
      router: @
    view.render()
