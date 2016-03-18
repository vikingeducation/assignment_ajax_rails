# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

seed_multiplier = 1

movies = []
(8*seed_multiplier).times do |user|
  movies << Movie.create( [ {
    title: Faker::Name.title, 
    release_date: Faker::Date.between(10.years.ago, Date.today)
    }])
end


reviews = []
(8*seed_multiplier).times do |review|
  reviews << Review.create([{
    reviewer_name: Faker::Name.name, 
    title: Faker::Date.between(10.years.ago, Date.today),
    review_text: Faker::Lorem.paragraph, 
    review_date: Faker::Date.between(5.years.ago, Date.today) 
    }])
end



