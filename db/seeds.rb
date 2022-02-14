# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

DatabaseCleaner.clean_with(:truncation) #permet d'éviter de faire tous les destroys all et regénère les id à partir de 1

cities = []
gossips = []
join_table_gossip_tags = []
tags = []
users = []

30.times do |x|
    city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
    cities << city
end

30.times do |x|
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.safe_email, age: rand(18..99), city_id: cities[rand(0..29)].id)
    users << user
end

30.times do |x|
    gossip = Gossip.create(title: Faker::Movies::HarryPotter.book, content: Faker::Movies::HarryPotter.quote, user_id: users[rand(0..29)].id)
    gossips << gossip
end

30.times do |x|
    tag = Tag.create(title: Faker::Book.genre)
    tags << tag
end

30.times do |x|
    join = JoinTableGossipTag.create(gossip_id: gossips[rand(0..29)].id, tag_id: tags[rand(0..29)].id)
    join_table_gossip_tags << join
end