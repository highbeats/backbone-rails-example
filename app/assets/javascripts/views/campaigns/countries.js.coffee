class Tapp.Views.CampaignsCountries extends Backbone.View

  template: JST['campaigns/country']
  className: "input-group c"
  render: ->
    @$el.html(@template())
    @
