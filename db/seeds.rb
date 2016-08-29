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
 password: "testtest"
)
User.create(
 name: "rbk",
 email: "r@mac.com",
 role: 0,
 password: "testtest",
 publishable_key: ENV['PUBLISHABLE_KEY'],
 provider: ENV['PROVIDER'],
 uid: ENV['UID'],
 access_code: ENV['ACCESS_CODE']
)
User.create(
 name:'buyer-name',
 email: 'buy@mail.com',
 role: 0,
 password: "testtest"
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
  spot_image_file_name: '0gPFGAu.jpg'
  # created_at: "2015-2-15 12:04:01"
  )
end
spots = Spot.all



puts"#{Park.count} parks"
puts"#{Term.count} terms"
puts "seed done!"
puts "#{Spot.count} spots"
