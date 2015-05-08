# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.destroy_all
Review.destroy_all

i = 1
10.times do
  Movie.create(
    name: "Toy Story #{i}",
    release_date: Time.at(rand * Time.now.to_i)
  )
  i+=1
end

15.times do
  movie = Movie.all.sample
  Review.create(
    reviewer_name: "bill #{i}",
    title: movie.name,
    review_text: "Love this film #{i} times",
    movie_id: movie.id
    )
  i+=1
end