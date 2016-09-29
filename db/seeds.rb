# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.destroy_all
Review.destroy_all

5.times do
  Movie.create(title: Faker::Superhero.name, release_date: Time.now)
end

Movie.all.each  do |movie|
  Review.create(reviewer_name: Faker::GameOfThrones.character,
                title: Faker::StarWars.quote,
                review_text: Faker::ChuckNorris.fact,
                review_date: Time.now,
                movie_id: movie.id)
end
