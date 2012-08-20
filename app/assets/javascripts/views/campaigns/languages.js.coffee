class Tapp.Views.CampaignsLanguages extends Backbone.View

  template: JST['campaigns/language_selector']

  tagName: "span"
  class: "language-selector clearfix"

  render: =>
    @$el.html(@template())
    @
