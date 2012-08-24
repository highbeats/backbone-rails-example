class Tapp.Views.BrandsNew extends Backbone.View

  template: JST['brands/new']


  events:
    "click #save_brand": "saveBrand"

  render: =>
    @$el.html(@template(companies: @companies.models))
    @

  initialize: ->
    @collection = @options.collection
    @companies = @options.companies
    @companies.on "all", @render, this
    @router = @options.router


  saveBrand: (e) ->
    attributes =
      name: @$("#brand_name").val()
      company_id: @$("#company_id").val()
    if @collection.create attributes
      @router.navigate "#brands", trigger: true
    else
      alert "There were errors!"
