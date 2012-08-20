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
