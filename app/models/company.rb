class Company < ActiveRecord::Base
  attr_accessible :address, :name, :phone

  has_many :brands
  has_many :campaigns, through: :brands
end
