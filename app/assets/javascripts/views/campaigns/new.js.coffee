class Tapp.Views.CampaignsNew extends Backbone.View

  template: JST['campaigns/new']

  events:
    "click .add-country": "addCountrySelector"
    "click #save_campaign": "saveCampaign"

  render: =>
    @$el.html(@template(brands: @brands.models))
    @

  initialize: ->
    @collection = @options.collection
    @brands = @options.brands
    @router = @options.router

    @brands.on "all", @render, this

  addCountrySelector: ->
    view = new Tapp.Views.CampaignsCountries()
    @$("form").find(".countries-languages")
      .append(view.render().el)
    false

  saveCampaign: (e) ->
    form = @$("form")
    countries = ViewsHelpers.serializeCountriesObject(form)
    attributes =
      brand_id: @$("#brand_id").val()
      start_from_date: @$("#start_from_date").val()
      end_date: @$("#end_date").val()
      countries: countries
    if @collection.create attributes
      @router.navigate "#campaigns", trigger: true
    else
      @$el.find("#flashes").append("Something went wrong!")
