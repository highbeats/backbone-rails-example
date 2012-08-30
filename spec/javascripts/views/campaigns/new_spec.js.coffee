loadFixtures "layout"

describe "CampaignsNew", ->
  beforeEach ->

    @view = new Tapp.Views.CampaignsNew
      el: $(".content")
      collection: new Tapp.Collections.Campaigns()
      brands: new Tapp.Collections.Brands()
      router: new Tapp.Routers.Campaigns()

  it "sets root element", ->
    expect(@view.el.selector).toEqual(".content")

