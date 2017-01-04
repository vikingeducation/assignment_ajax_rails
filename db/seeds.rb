# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all


50.times do
  m = Movie.new
  m.title = Faker::Space.moon
  m.release_date = Faker::Date.backward(1400)
  m.save!

  r = Review.new
  r.reviewer_name = Faker::Name.name
  r.title = Faker::Hipster.sentence
  r.review_text = Faker::Hipster.paragraph
  r.review_date = m.release_date = Faker::Date.backward(14)
  r.movie_id = Movie.all.sample.id
  r.save!
end

puts "Data created...."
