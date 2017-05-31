# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clearing all movies and reviews...'
Movie.destroy_all

puts 'Creating movies...'

10.times do
  Movie.create!(title: Faker::Book.title, release_date: Faker::Date.between(2.years.ago, 1.years.ago))
end

Movie.all.each do |m|
  rand(1..5).times do
    m.reviews.create!(reviewer_name: Faker::Name.name, review_text: Faker::Hacker.say_something_smart, title: Faker::Hipster.sentence(3), review_date: Faker::Date.between(m.release_date, Date.today))
  end
end
