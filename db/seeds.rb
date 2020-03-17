# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# User.destroy_all
# Pin.destroy_all
# Vote.destroy_all
# Comment.destroy_all

# mehdi = User.create!(username: 'Mehdi', email: 'mehdi@mail.fr', password: 'password', address: 'Paris')
# yvan = User.create!(username: 'Yvan', email: 'Yvan@mail.fr', password: 'password', address: 'Pau')
# manu = User.create!(username: 'Manu', email: 'manu@mail.fr', password: 'password', address: 'Marseille')
# 10.times do
#   User.create!(
#             username: Faker::JapaneseMedia::DragonBall.character,
#             email: Faker::Internet.email,
#             password: "password",
#             address: %w(Paris Marseille Lille Lyon Genay Pau).sample
#           )
# end


# puts "#{User.count} users created"

# 10.times do
#   Pin.create!(
#     title: Faker::Book.title,
#     description: Faker::TvShows::Simpsons.quote,
#     address: %w(Paris Marseille Lille Lyon Genay Pau).sample,
#     user_id: rand(1..10)
#     )
# end

# puts "#{Pin.count} pins created"

30.times do
  Vote.create!(
    note: rand(0...5),
    pin_id: rand(1..10),
    user_id: rand(1..10)
    )
end
puts "#{Vote.count} votes created"

25.times do
  Comment.create!(
    content: Faker::TvShows::RickAndMorty.quote,
    user_id: rand(1..10),
    pin_id: rand(1..10)
    )
end

puts "#{Comment.count} comments created"
