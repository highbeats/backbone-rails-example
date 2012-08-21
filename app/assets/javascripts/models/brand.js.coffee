class Tapp.Models.Brand extends Backbone.Model
  paramsRoot: "brand"

  defaults:
    id: null
    name: null
    company_id: null
    company: null

  company: =>
    url = "companies/#{@get('company_id')}"
    @company = new Tapp.Models.Company()
    @company.fetch(url: url)

  initialize: ->
    @company() if @get("company_id")?

