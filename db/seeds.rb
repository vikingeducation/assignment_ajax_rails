# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MULTIPLIER = 10

def generate_movies(num)
  num.times do |i|
    Movie.create(
      title: Faker::Hipster.words(3).join(" "),
      release_date: Faker::Date.backward(36500)
    )
  end
end

def generate_reviews(num)
  Movie.all.each do |movie|
    num.times do |i|
      Review.create(
        reviewer_name: Faker::Name.name,
        title: Faker::Hipster.sentence(1),
        review_text: Faker::Hipster.paragraph(4),
        review_date: Faker::Date.between(movie.release_date, Date.today),
        movie_id: movie.id
      )
    end
  end
end

generate_movies(MULTIPLIER)
generate_reviews(3)
