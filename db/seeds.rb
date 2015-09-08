# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

srand(12345)

20.times do |movie_name|
  random_time = DateTime.now - rand(1000) - 10
  new_movie = Movie.create(name: "Movie # #{movie_name}", release_date: random_time)
  rand(5).times do |reviewer|
    Review.create(movie: new_movie,
                  reviewer_name: "Reviewer #{reviewer}",
                  title: "#{reviewer ** 4}",
                  text: "Best thing since #{reviewer * 2}",
                  date: random_time + rand(10))
  end
end


