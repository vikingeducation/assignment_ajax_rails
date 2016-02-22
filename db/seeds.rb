# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.destroy_all
Review.destroy_all

Movie.create( title: 'The Shawshank Redemption', 
              release_date: DateTime.new(1994,10,14) )
Movie.create( title: 'The Godfather', 
              release_date: DateTime.new(1972,3,24) )
Movie.create( title: 'Pulp Fiction', 
              release_date: DateTime.new(1994,10,14) )
Movie.create( title: '12 Angry Men', 
              release_date: DateTime.new(1957,4,1) )
Movie.create( title: 'The Good, the Bad, and the Ugly', 
              release_date: DateTime.new(1966,12,23) )

reviews = ["super awesome", "kinda lame", 'meh, i dunno, i liked the book better']

10.times do |t|
  r = Review.new
  r.review_text = reviews.sample
  r.review_date = Faker::Date.between(60.days.ago, Date.today)
  r.title = Faker::Lorem.word
  r.reviewer_name = Faker::Name.name
  r.movie_id = Movie.all.sample.id
  r.save!
end