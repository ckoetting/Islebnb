# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

images = ["https://images.unsplash.com/photo-1533604145636-765f22ac7352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60", "https://images.unsplash.com/photo-1553773077-91673524aafa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80", "https://images.unsplash.com/photo-1535779023901-a39d15762564?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"]

puts 'Creating 10 fake listings...'
10.times do
  files = []
  images.each do |image|
    files << URI.open("#{image}")
    end
  listing = Listing.new(
    title:"#{Faker::Address.city_prefix}, #{Faker::Address.country}", description:"#{Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 5)}"
    )
  files.each do |file|
    listing.photos.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end
    title:    "#{Faker::TvShows::FamilyGuy.character}",
  listing.save!
end
puts 'Finished!'


puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    full_name: Faker::Movies::LordOfTheRings.character
  )
  user.save!
end
puts 'Finished!'

