window.Tapp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    window.routerCampaigns = new Tapp.Routers.Campaigns()
    window.routerBrands    = new Tapp.Routers.Brands()
    window.routerCompanies = new Tapp.Routers.Companies()
    Backbone.history.start()

$ ->
  $("div#navigation ul.nav").on "click", "a", ->
    section = $(this).text()
    $(this).closest("ul").find("li").removeClass "current"
    $(this).parent().addClass "current"
  Tapp.init()

# Helper functions
window.ViewsHelpers =

  serializeCountriesObject: (form) ->
    cSelectors = $("form").find ".country-selector"
    countries = {}
    _.each cSelectors, (country, i) ->
      name = $(country).val()
      if name.length
        countries[name] = []
        langs = $(country).parent()
          .find(".country-languages")
          .find("select")
        _.each langs, (lang, i) ->
          langAbbr = $(lang).val()
          countries[name].push langAbbr if langAbbr.length
    countries

  processInputs: (form, model) ->
    inputs = $(form).find(".inputs").children(":input")
    attributes = {}
    _.each inputs, (input, a) ->
      inputVal = $(input).val()
      if inputVal.length
        inputName = $(input).attr("id")
        attributes[inputName] = inputVal unless inputVal is model.get(inputName)
    attributes

