require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Review.destroy_all

titles = ['Lord of the Rings', 'The Big Lebowski', 'Star Trek', 'The Godfather', 'Wicker Man']

titles.each do |title|
  movie = Movie.create(
        title: title,
        release_date: Date.new(2016,9,19)
    )
  20.times do 
    Review.create(
      reviwer_name: "Happy Reviewer",
      title: "Good movie",
      review_text: "See this movie!",
      review_date: Date.new(2016,9,19),
      movie_id: movie.id
      )
  end
end