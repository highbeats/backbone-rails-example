class Tapp.Routers.Companies extends Backbone.Router

  routes:
    "companies": "index"
    "companies/new": "new"

  initialize: ->
    @companies = new Tapp.Collections.Companies()
    @companies.fetch()

  index: ->
    @companiesIndexView = new Tapp.Views.CompaniesIndex
      el: $(".content"),
      collection: @companies,
      router: @

    @companiesIndexView.render()

  new: ->
    @companiesNewView = new Tapp.Views.CompaniesNew
      el: $(".content"),
      collection: @companies,
      router: @

    @companiesNewView.render()
