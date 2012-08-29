class Tapp.Models.Campaign extends Backbone.Model
  paramRoot: "campaign"

  defaults:
    id: null
    start_from_date: null
    end_date: null
    countries: null
    brand_id: null
    brand_name: null

  brand: =>
    @brand = new Tapp.Models.Brand()
    url = "brands/#{@get('brand_id')}"
    @brand.fetch(url: url)
    @brand

  adoptCountriesList: =>
    countLangs = []
    try
      _.each @get("countries"), (langs, countryName) ->
        obj =
          country: countryName
          languages: langs
        countLangs.push obj
    countLangs


  initialize: ->
    @countries_langs = @adoptCountriesList()

