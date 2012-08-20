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
    @countries = {}
    @languages = []

  addCountrySelector: ->
    selectCountriesView = new Tapp.Views.CampaignsCountries()
    $("form").find(".countries-languages")
      .append(selectCountriesView.render().el)
    false

  saveCampaign: (e) ->
    e.preventDefault()
    selects = $('form').find('.country-selector')
    countries = {}
    _.each selects, (select, i) ->
      name = $(select).val()
      if name.length
        countries[name] = []
        langs = $(select)
          .parent()
          .find(".country-languages")
          .find(".language-select")
        _.each langs, (lang, i) ->
          langVal = $(lang).val()
          countries[name].push langVal if langVal.length
    attributes =
      brand_id: $("#brand_id").val(),
      start_from_date: $(".datetime").first().val(),
      end_date: $(".datetime").last().val(),
      countries: JSON.stringify countries
    if @collection.create attributes
      alert("Success!")

