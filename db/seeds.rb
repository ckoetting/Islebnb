# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake listings...'
10.times do
  listing = Listing.new(
    title:    "#{Faker::TvShows::FamilyGuy.character}",
    description: "#{Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 5)}"
  )
  listing.save!
end
puts 'Finished!'


puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    full_name:    Faker::Name.name,
  )
  user.save!
end
puts 'Finished!'

