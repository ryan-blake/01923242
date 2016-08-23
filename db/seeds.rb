# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




10.times do
  Spot.create!(
  title:       Faker::Hipster.word,
  description:    Faker::Hipster.paragraph,
  length: Faker::Number.number(2),
  width: Faker::Number.number(2),
  depth: Faker::Number.number(2)
  # created_at: "2015-2-15 12:04:01"
  )
end
spots = Spot.all



puts "seed done!"
puts "#{Spot.count} spots"
