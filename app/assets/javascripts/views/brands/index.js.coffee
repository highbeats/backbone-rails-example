class Tapp.Views.BrandsIndex extends Backbone.View

  template: JST['brands/index']

  events:
    "click .destroy-brand": "deleteBrand"

  render: ->
    @$el.html(@template(brands: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @campaigns = @options.campaigns
    @collection.on "all", @render, this

  deleteBrand: (e) ->
    e.preventDefault()
    brandId = $(e.target).data("brand_id")
    @brand = @collection.get brandId
    campaignsInProgress = @brand.checkCampaignsInProgress(@campaigns)
    unless campaignsInProgress.length
      @brand.destroy success: (model, response) ->
        alert "Brand #{model.get("name")} deleted successfully!"
    else
      alert "Can't delete, there are #{campaignsInProgress.length} campaign(s) in progress!"
