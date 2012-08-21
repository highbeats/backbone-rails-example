class Tapp.Routers.Brands extends Backbone.Router

  initialize: ->
    @brands or= new Tapp.Collections.Brands()
    @companies = new Tapp.Collections.Companies()
    @campaigns = new Tapp.Collections.Campaigns()
    @campaigns.fetch()
    @brands.fetch()
    @companies.fetch()

  routes:
    "brands": "index"
    "brands/new": "new"
    "brands/:id/edit": "edit"

  index: ->
    @brandsIndexView = new Tapp.Views.BrandsIndex
      el: $(".content"),
      collection: @brands,
      campaigns: @campaigns,
      router: @
    @brandsIndexView.render()

  new: ->
    @brandsNewView = new Tapp.Views.BrandsNew
      el: $(".content"),
      collection: @brands,
      companies: @companies,
      router: @
    @brandsNewView.render()

  edit: (id) ->
    @brand = @brands.get id
    @brandsEditView = new Tapp.Views.BrandsEdit
      el: $(".content"),
      model: @brand,
      companies: @companies,
      router: @
    @brandsEditView.render()


