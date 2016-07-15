# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

200000.times do |i|
  u = User.new(email: "test_#{i}@email.com", name: "user_name_#{i}", password: "password")
  u.skip_confirmation!
  u.save
  puts i
end
