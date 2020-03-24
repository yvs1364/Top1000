# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "csv"

User.destroy_all
Pin.destroy_all
Vote.destroy_all
Comment.destroy_all

mehdi = User.create!(username: 'Mehdi', email: 'mehdi@mail.fr', password: 'password', address: 'marseille')
yvan = User.create!(username: 'Yvan', email: 'Yvan@mail.fr', password: 'password', address: "Marseille")
manu = User.create!(username: 'Manu', email: 'manu@mail.fr', password: 'password', address: 'Marseille')

puts "#{User.count} users created"


  csv_options = { col_sep: "\t", quote_char: '"', :headers => true }
  filepath    = "#{Rails.root}/db/poi_3.csv"

    CSV.foreach(filepath, csv_options) do |row|
      Pin.create!(
        title: row["name"],
        description: row["type"],
        latitude: row["@lat"],
        longitude: row["@lon"],
        user: [yvan, manu, mehdi].sample
      )
      puts "created #{row['name']}"
end

pins = Pin.all
puts "#{Pin.count} pins created"

30.times do
  Vote.create!(
    note: rand(0...5),
    pin: pins.sample,
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
      pin: pins.sample
    )
end

puts "#{Comment.count} comments created"
