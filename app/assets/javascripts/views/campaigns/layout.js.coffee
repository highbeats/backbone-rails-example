class Tapp.Views.CampaignsLayout extends Backbone.View

  el: $("#main")
  template: JST["campaigns/layout"]

  render: ->
    @$el.append(@template())
    @

  initialize: ->
    
