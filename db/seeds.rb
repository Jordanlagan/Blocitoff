require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create!( email: Faker::Internet.email, password: "helloworld", confirmed_at: Time.now )
end
users = User.all

250.times do
  Item.create!( name: Faker::WorldOfWarcraft.quote, user: users.sample )
end

puts "Users seeded"
puts "Tasks seeded"
