# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Pin.destroy_all
Vote.destroy_all
Comment.destroy_all

mehdi = User.create!(username: 'Mehdi', email: 'mehdi@mail.fr', password: 'password', address: 'marseille')
yvan = User.create!(username: 'Yvan', email: 'Yvan@mail.fr', password: 'password', address: "Marseille")
manu = User.create!(username: 'Manu', email: 'manu@mail.fr', password: 'password', address: 'Marseille')
# 10.times do
#   User.create!(
#             username: Faker::JapaneseMedia::DragonBall.character,
#             email: Faker::Internet.email,
#             password: "password",
#             address: %w(Paris Marseille Lille Lyon Genay Pau).sample
#           )
# end


puts "#{User.count} users created"

10.times do
  Pin.create!(
    title: Faker::Book.title,
    description: %w(histoire1 histoire2 histoire3 histoire4 histoire5 histoire6 histoire7 histoire8 histoire9).sample,
    address: ["17 Rue de la Loge 13002 Marseille","68 Quai du Port 13002 Marseille",
    "62 Quai du Port 13002 Marseille","2 Rue de la Guirlande 13002 Marseille"].sample,
    user: [yvan, manu, mehdi].sample
    )
end

puts "#{Pin.count} pins created"

30.times do
  Vote.create!(
    note: rand(0...5),
    pin_id: rand(1..10),
    user: [yvan, manu, mehdi].sample
    )
end
puts "#{Vote.count} votes created"

20.times do
  Comment.create!(
    content: ["c'est jolie", "ouais bof", "ça n'a rien à voir mais aller l'om",
      "j'ai vu la même mais autre part", "a quand la bière ?",
      "hum... je ne sais pas quoi dire", "ça va toi ?"].sample,
      user: [yvan, manu, mehdi].sample,
      pin_id: rand(1..10)
    )
end

puts "#{Comment.count} comments created"
