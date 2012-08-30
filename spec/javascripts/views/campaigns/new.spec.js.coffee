describe "new", ->
  beforeEach ->
    @collection = new Tapp.Collections.Campaigns
    @brands     = new Tapp.Collections.Brands
      id: 1, name: "Ppsi",
      id: 2, name: "Ccl"
    @router     = new Tapp.Routers.Campaigns

    @view = new Tapp.Views.CampaignsNew
      el: $(".content"),
      collection: @collection,
      router: @router

    setFixtures('<div id="main"><div class="content"></div></div>')

  describe "Element", ->
    expect(@view.el.className).toEqual(".content")
