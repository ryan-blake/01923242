# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(
  :email => "ryan_blake@icloud.com",
  :name => "ryan",
  :password => "testtest",
  :role => "member"
);
user.skip_confirmation!
user.save!

admin = User.create!(
  :email => "ryan_blake@icloud.com",
  :name => "ryan",
  :password => "testtest",
  :role => "admin"
);
admin.skip_confirmation!
admin.save!
