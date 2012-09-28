class Tapp.Views.CampaignsNew extends Backbone.View

  template: JST['campaigns/new']

  events:
    "click .country": "addCountry"
    "click #save_campaign": "saveCampaign"

  render: ->
    @$el.html(@template(brands: @brands.models))
    @$el.find(".datetime").datepicker()
    @$el.find(".datetime").datepicker "option", "dateFormat", "dd/mm/yy"
    @

  initialize: ->
    @el = @options.el
    @collection = @options.collection
    @brands = @options.brands
    @router = @options.router

    @brands.on "all", @render, this

  addCountry: ->
    view = new Tapp.Views.CampaignsCountries()
    @$("form").find(".actions").before(view.render().el)
    false

  saveCampaign: (e) ->
    e.preventDefault()
    form = @$("form")
    attributes =
      brand_id: @$("#brand_id").val()
      start_from_date: @$("#start_from_date").val()
      end_date: @$("#end_date").val()
    if @model = @collection.create attributes
      countriesAttributes = []
      cGroups = form.find(".input-group.c")
      _.each cGroups, (group, index) ->
        obj =
          name: $(group).find(".country_name").val()
          languages: new Array( $(group).find(".country_languages").val() )
        countriesAttributes.push obj
      console.log countriesAttributes
      @countries = new Tapp.Collections.Countries(countriesAttributes)
      if @model.save(countries: @countries)
        @router.navigate "#campaigns", trigger: true
      else
        @$el.find("#flashes").append("Something went wrong!")
