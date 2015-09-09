# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 30
Movie.destroy_all
Review.destroy_all

def generate_movie
  new_movie = Movie.new
  new_movie.name = Faker::Book.title
  new_movie.release_date = Faker::Date.backward(5000)
  new_movie.save
end

def generate_review
  review = Review.new
  review.reviewer_name = Faker::Name.name
  review.title = Faker::Book.title
  review.text = Faker::Lorem.sentence
  review.movie_id = Movie.ids.sample
  review.save
end

MULTIPLIER.times do
  generate_movie
  generate_review
end