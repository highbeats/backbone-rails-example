class Tapp.Views.CampaignsNew extends Backbone.View

  template: JST['campaigns/new']


  events:
    "click .add-country": "addCountrySelector"
    "click #save_campaign": "saveCampaign"

  render: =>
    @$el.html(@template(brands: @brands.models))
    @$el.find("input.datetime").datepicker()
    @$el.find("input.datetime").datepicker("option", "dateFormat", "dd/mm/yy")
    @

  initialize: ->
    @collection = @options.collection
    @brands = @options.brands
    @brands.on "all", @render, this
    @router = @options.router

  addCountrySelector: ->
    selectCountriesView = new Tapp.Views.CampaignsCountries()
    $("form").find(".countries-languages")
      .append(selectCountriesView.render().el)
    false

  saveCampaign: (e) ->
    form = @$("form")
    countries = ViewsHelpers.serializeCountriesObject(form)
    attributes =
      brand_id: @$("#brand_id").val(),
      start_from_date: @$(".datetime").first().val(),
      end_date: @$(".datetime").last().val(),
      countries: countries
    if @collection.create(attributes)
      @collection.fetch()
      _.each @collection.models, (model, i) ->
        model.brand()
      @router.navigate "#campaigns", trigger: true
    else
      alert("There were errors!")
