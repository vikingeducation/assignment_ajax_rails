# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.destroy_all
Review.destroy_all


10.times do

  m = Movie.new
  m.title = Faker::Beer.name
  m.release_date = Time.now
  m.save

  5.times do
    r = m.reviews.build
    r.reviewer_name = Faker::Superhero.name
    r.title = Faker::Hipster.word
    r.review_text = Faker::Hipster.sentence
    r.review_date = Time.now
    r.save
  end

end
