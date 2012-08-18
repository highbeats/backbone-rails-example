class Campaign < ActiveRecord::Base
  attr_accessible :brand_id, :countries, :end_date, :start_from_date
  belongs_to :brand

  def as_json(options={})
    {
      id: id,
      brand_id: brand_id,
      start_from_date: start_from_date.strftime("%d %b, %Y"),
      end_date: end_date.strftime("%d %b, %Y"),
      countries: countries.present? ? JSON.parse(countries) : nil
    }
  end
end
