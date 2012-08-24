class Tapp.Views.CompaniesNew extends Backbone.View

  template: JST['companies/new']


  events:
    "click #save_company": "saveCompany"

  render: =>
    @$el.html(@template())
    @

  initialize: ->
    @collection = @options.collection

  saveCompany: (e) ->
    attributes =
      name: @$("#company_name").val()
      address: @$("#company_address").val()
      phone: @$("#company_phone").val()
    if @collection.create attributes
      @router.navigate "#companies", trigger: true
    else
      alert "There were errors!"
