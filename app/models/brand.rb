class Brand < ActiveRecord::Base
  attr_accessible :company_id, :name

  belongs_to :company
  delegate :name, to: :company, prefix: true
  has_many :campaigns, :dependent => :destroy
end
