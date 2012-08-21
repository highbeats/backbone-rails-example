class Tapp.Routers.Brands extends Backbone.Router

  initialize: ->
    @brands or= new Tapp.Collections.Brands()
    @companies = new Tapp.Collections.Companies()
    @brands.fetch()
    @companies.fetch()

  routes:
    "brands": "index"
    "brands/new": "new"

  index: ->
    @brandsIndexView = new Tapp.Views.BrandsIndex
      el: $(".content"),
      collection: @brands,
      router: @
    @brandsIndexView.render()

  new: ->
    @brandsNewView = new Tapp.Views.BrandsNew
      el: $(".content"),
      collection: @brands,
      companies: @companies,
      router: @
    @brandsNewView.render()

