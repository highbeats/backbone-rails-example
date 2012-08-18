window.Tapp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    window.router = new Tapp.Routers.Campaigns()
    Backbone.history.start(pushState: true)
    $(document).on "click", "a", (e) ->
      href = $(this).attr "href"
      unless href is "/"
        e.preventDefault()
        Backbone.history.navigate(href, trigger: true)

$ ->
  $("div#navigation ul.nav").on "click", "a", ->
    section = $(this).text()
    $(this).closest("ul").find("li").removeClass "current"
    $(this).parent().addClass "current"
  Tapp.init()
