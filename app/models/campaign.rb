class Campaign < ActiveRecord::Base
  attr_accessible :brand_id, :brand_name, :countries, :end_date, :start_from_date
  belongs_to :brand

  serialize :countries, JSON

  attr_accessor :brand_name

  def as_json(options={})
    {
      id: id,
      brand_id: brand_id,
      start_from_date: start_from_date.present? ? start_from_date.strftime("%d %b, %Y") : nil,
      end_date: end_date.present? ? end_date.strftime("%d %b, %Y") : nil,
      countries: countries,
      brand_name: brand_name
    }
  end

  def brand_name
    brand.name if brand.present?
  end
end
