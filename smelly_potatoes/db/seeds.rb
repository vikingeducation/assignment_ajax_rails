# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying movies and reviews"

Movie.destroy_all
Review.destroy_all

puts "Movies and reviews destroyed"

NUM_MOVIES = 30
NUM_REVIEWS_PER_MOVIE = 3


puts "Creating movies"

NUM_MOVIES.times do
  movie = Movie.create(title: Faker::Superhero.name, release_date: Faker::Date.between(2.years.ago, Date.today))


  puts "Creating reviews for #{movie.title}"

  NUM_REVIEWS_PER_MOVIE.times do
    movie.reviews << Review.create(
                                reviewer_name: Faker::Name.name,
                                title: Faker::Team.name,
                                review_text: Faker::Lorem.paragraph,
                                review_date: Faker::Date.between(2.years.ago, Date.today)
                              )
  end
end

puts "Movies and reviews done"

