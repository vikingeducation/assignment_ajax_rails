# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MULTIPLIER = 10

def create_movie
  m = Movie.new
  m.title = Faker::Book.title
  m.release_date = Faker::Date.between(1.year.ago, Date.today)
  m.save!
end

def create_review(movie)
  r = Review.new
  r.reviewer_name = Faker::Name.name
  r.title = Faker::Hipster.sentence
  r.review_text = Faker::Hipster.paragraph
  r.review_date = Faker::Date.between(movie.release_date, Date.today)
  r.movie_id = movie.id
  r.save!
end

MULTIPLIER.times do
  create_movie
end

Movie.all.each do |movie|
  3.times do
    create_review(movie)
  end
end