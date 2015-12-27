# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Let's create some new movies
Movie.delete_all
10.times do |m|
	movie = Movie.new
	movie.title = Faker::Book.title
	movie.release_date = Faker::Date.backward(14)
	movie.save!
end

# And let's create some reviews for those movies
Review.delete_all
5.times do |r|
	movie_ids = Movie.all.pluck(:id)
	review = Review.new
	review.reviewer_name = Faker::Name.name
	review.title = "Foo Title #{r}"
	review.review_text = Faker::Hipster.paragraph
	review.review_date = Faker::Date.backward(14)
	review.movie_id = movie_ids.sample
	review.save!
end