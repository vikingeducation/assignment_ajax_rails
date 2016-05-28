# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

puts "Starting seeds...\n\n"
MULTIPLIER = 5


# Blow away the existing data
puts "Removing old data..."
tables = [Movie, Review]

tables.each do |table|
  table.destroy_all
end
puts "Old data removed.\n\n"


# Add new data
puts "Adding movies..."

(5 * MULTIPLIER).times do
  release_date = Faker::Date.backward(365 * 50)
  Movie.create(title: Faker::Book.title, release_date: release_date)
end
puts "Movies created.\n\n"


# Add new data
puts "Adding reviews..."

(10 * MULTIPLIER).times do
  review = Review.new
  review.reviewer_name = Faker::App.author
  review.title = Faker::Company.catch_phrase
  review.review_text = Faker::Hipster.paragraphs(1..3)
  review.review_date = Faker::Date.backward(365 * 10)
  review.movie_id = Movie.pluck(:id).sample
  review.save
end
puts "Reviews created.\n\n"