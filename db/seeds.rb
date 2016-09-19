# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating movies"
Movie.create(title: "Star Wars", release_date: "01/01/1995")
Movie.create(title: "Lord of the Rings", release_date: "01/01/1997")
Movie.create(title: "Jaws", release_date: "01/01/1987")

puts "creating reviews"
Movie.first.reviews.create(reviewer_name: "Bob Seger", title: "Best Movie Ever", review_text: "This movie was awesome", review_date: "01/02/1995")