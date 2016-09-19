# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  Movie.create(title: Faker::Book.title,
    release_date: Faker::Date.between(9000.days.ago, Date.today))
end

50.times do
  Review.create(reviewer_name: Faker::Name.name,
    title: Faker::Hipster.word,
    review_text: Faker::Hipster.sentence,
    review_date: Faker::Date.between(90.days.ago, Date.today),
    movie_id: Movie.all.pluck(:id).sample)
end
