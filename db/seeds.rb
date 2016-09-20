# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.delete_all
Review.delete_all


def generate_movie
  movie = Movie.new
  movie.title = Faker::Pokemon.name
  movie.release_date = Faker::Date.between(10.days.ago, 5.days.ago)
  movie.save
end

def generate_review
  review = Review.new
  review.reviewer_name = Faker::GameOfThrones.character
  review.review_date = Faker::Date.between(4.days.ago, Date.today)
  review.title = Faker::Book.title
  review.review_text = Faker::Hipster.sentences[0]
  review.movie_id = Movie.all.sample.id
  review.save
end

5.times do 
  generate_movie
end

10.times do
  generate_review
end
