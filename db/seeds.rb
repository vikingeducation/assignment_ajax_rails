# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.delete_all
Review.delete_all

Movie.create(title: "Top Gun")
Movie.create(title: "Wolf of Wall Street")
Movie.create(title: "The Usual Suspects")
Movie.create(title: "Django Unchained")


Movie.all.each do |movie| 
  
  3.times do |index|
    Review.create(title: movie.title + " review",
                 movie_id: movie.id,
                 name: Faker::Superhero.name,
                 review_text: Faker::Lorem.sentence(3, true) )
  end  

end
