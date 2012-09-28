class CampaignConverter
  attr_reader :campaign

  def initialize(campaign)
    @campaign = campaign
  end

  def to_json
    'to json'
  end

  def to_csv
    'to csv'
  end

  def to_xml
    'to xml'
  end
end
