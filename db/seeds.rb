# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

puts "Clearing data..."
Movie.destroy_all
Review.destroy_all
puts "Data cleard!"

puts "Generating Movies..."

5.times do
  new_movie = Movie.new
  new_movie[:title] = FFaker::Book.title
  new_movie[:release_time] = FFaker::Date.backward(2000)
  new_movie.save!
end

puts "five movies generated!"

puts "Generating reviews..."

20.times do
  new_review = Review.new
  new_review[:reviewer_name] = FFaker::Name.name
  new_review[:title] = FFaker::Lorem.sentence
  new_review[:review_text] = FFaker::Lorem.paragraph
  new_review[:review_date] = FFaker::Date.backward(100)
  new_review[:movie_id] = Movie.pluck(:id).sample
  new_review.save!
end

puts "Review generated!"
puts "Done!"
