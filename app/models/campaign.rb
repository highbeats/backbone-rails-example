class Campaign < ActiveRecord::Base
  attr_accessible :brand_id, :brand_name, :countries, :end_date, :start_from_date
  belongs_to :brand

  delegate :name, to: :brand, prefix: true
  delegate :to_json, :to_csv, :to_xml, to: :converter

  serialize :countries, JSON

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

  def converter
    CampaignConverter.new(self)
  end
end
