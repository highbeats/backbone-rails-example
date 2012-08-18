# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
3.times do |i|
  c = Company.create(name: "Company-#{i}", phone: (1..5).each_with_object("") {|n, a| a << n*i}, address: "#{i}street")
  b = c.brands.create(name: "BrandName#{i}")
  b.campaigns.create(start_from_date: Time.now, end_date: Time.now + 1.week)
end
