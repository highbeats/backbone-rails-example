class Company < ActiveRecord::Base
  attr_accessible :address, :name, :phone

  has_many :brands, dependent: :destroy
  has_many :campaigns, through: :brands
end
