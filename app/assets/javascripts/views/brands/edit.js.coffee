class Tapp.Views.BrandsEdit extends Backbone.View

  template: JST['brands/new']

  events: 
    "click #update_brand": "updateBrand"

  render: ->
    @$el.html(@template(companies: @companies.models, brand: @model))
    @

  initialize: ->
    @companies = @options.companies
    @model = @options.model
    @router = @options.router

  updateBrand: ->
    attributes =
      name: $("#brand_name").val()
      company_id: $("#company_id").val()
    if @model.save attributes
      @router.navigate "#brands", trigger: true
    else
      alert "Can't update"
