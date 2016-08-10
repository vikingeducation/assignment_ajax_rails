# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'creating movies'

10.times do |i|
  movie = Movie.new

  movie.title = Faker::Company.buzzword
  movie.release_date = Faker::Date.between(2.years.ago, Date.today)

  movie.save
end

puts 'movies done'

puts 'creating reviews'

20.times do

  movie = Movie.all.sample

  review = Review.new

  review.title = Faker::Company.catch_phrase
  review.reviewer_name = Faker::Name.name
  review.review_text = Faker::Lorem.sentence
  review.review_date = Faker::Date.between(movie.release_date, Date.today)

  review.movie_id = movie.id

  review.save
end

puts 'reviews done'
