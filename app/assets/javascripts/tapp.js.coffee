window.Tapp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    window.router = new Tapp.Routers.Campaigns()
    new Tapp.Routers.Application()
    Backbone.history.start()


$ ->
  $("div#navigation ul.nav").on "click", "a", ->
    section = $(this).text()
    $(this).closest("ul").find("li").removeClass "current"
    $(this).parent().addClass "current"
  Tapp.init()

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

