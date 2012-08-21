class Tapp.Views.CompaniesIndex extends Backbone.View

  template: JST['companies/index']

  events:
    "click .destroy-company": "deleteCompany"

  render: =>
    @$el.html(@template(companies: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, this

  deleteCompany: (e) ->
    e.preventDefault()
    companyId = $(e.target).data("company_id")
    @company = @collection.get companyId
    @company.destroy success: (model, response) ->
      alert "Comapny #{model.get('name')} deleted!"
