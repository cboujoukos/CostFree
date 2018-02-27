# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  User.create!(email: "user_#{i}@aol.com", password: "password")
end

10.times do |i|
  Activity.create!(title: "Activity #{i}", description: "This is the description of the activity")
end

#10.times do |i|
#  Category.create!(title: "Category #{i+1}")
#end

Category.create!(title: "Abandoned Places")
Category.create!(title: "Bicylce")
Category.create!(title: "Art")
Category.create!(title: "Nature")
Category.create!(title: "Urban")
Category.create!(title: "Sports")
Category.create!(title: "Tabletop Games")
Category.create!(title: "Indoor")
Category.create!(title: "Hiking")
Category.create!(title: "Architecture")
Category.create!(title: "Swimming")
Category.create!(title: "Social")
Category.create!(title: "Music")
Category.create!(title: "Walking")
Category.create!(title: "Parks")
