# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
 name: "ryan",
 email: "ryan_blake@mac.com",
 role: 1,
 password: "testtest",
 zipcode: 76210

)
User.create(
 name: "rbk",
 email: "r@mac.com",
 role: 0,
 password: "testtest",
 publishable_key: ENV['PUBLISHABLE_KEY'],
 provider: ENV['PROVIDER'],
 uid: ENV['UID'],
 access_code: ENV['ACCESS_CODE'],
 zipcode: 76135

)
User.create(
 name:'buyer-name',
 email: 'buy@mail.com',
 role: 0,
 password: "testtest",
 zipcode: 76262

)
users = User.all

term_array = %w{Long Short Short&Long}

term_array.each do |t|
  Term.find_or_create_by(
  name: t
  )
end
terms = Term.all

park_array = %w{Land Water}

 park_array.each do |t|
  Park.find_or_create_by(
  name: t
  )
end

parks = Park.all
zip_array = %w{76262 76210 76135 76137}


10.times do
  Spot.create!(
  title:       Faker::Hipster.word,
  description: Faker::Hipster.paragraph,
  length: Faker::Number.number(2),
  width: Faker::Number.number(2),
  depth: Faker::Number.number(2),
  term: terms.sample,
  park: parks.sample,
  covered: [true, false].sample,
  ramp: rand(1..10),
  price: rand(10..20),
  user_id: 2,
  image_url: 'http://apod.nasa.gov/apod/image/1407/m31_bers_960.jpg',
  zipcode: zip_array.sample

  # created_at: "2015-2-15 12:04:01"
  )
end
spots = Spot.all

distance_array = %w(10 20 30 50 100 150 200 350 400)

distance_array.each do |c|
  Distance.find_or_create_by(
    value: c
  )
end
distances = Distance.all


puts"#{Park.count} parks"
puts"#{Term.count} terms"
puts "seed done!"
puts "#{Spot.count} spots"
