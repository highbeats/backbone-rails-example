class Tapp.Routers.Application extends Backbone.Router

  initialize: ->
    @layout = new Tapp.Views.CampaignsLayout()
    @layout.render()
