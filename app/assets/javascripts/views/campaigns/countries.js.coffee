class Tapp.Views.CampaignsCountries extends Backbone.View

  template: JST['campaigns/country_selector']
  tagName: "div"
  className: "countries-selector clearfix"

  events:
    "click .add-lang": "addLang"

  render: =>
    @$el.html(@template())
    @

  addLang: =>
    langsView = new Tapp.Views.CampaignsLanguages()
    @$el.find(".country-languages").append(langsView.render().el)
    false
