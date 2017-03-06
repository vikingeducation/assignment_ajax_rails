# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying everything..."
Movie.destroy_all
Review.destroy_all
puts "DONE"

puts "movies..."
10.times do 
  Movie.create(
    title: Faker::Book.title,
    release_date: Faker::Date.backward(14)
    )
end
puts "DONE"

puts "reviews..."
Movie.all.each do |movie|
  3.times do 
    movie.reviews << Review.create(
                        title: Faker::Book.title,
                        reviewer_name: Faker::Name.name,
                        review_text: Faker::Hipster.paragraph,
                        review_date: Faker::Date.backward(14) 
                        )
  end
end
puts "DONE"