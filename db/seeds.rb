# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



names = ["Breaking Bad", "Limitless", "Foo Awesome", "World War Z", "Saving Private Ryan"]


names.each do |name|
  movie = Movie.new(title: name, release_date: Time.now)
  movie.save!

  3.times do 
    review = Review.new(reviewer_name: "Name", title: "Super Review", review_text: "AWESOME MOVIE YOU GOT THERE", review_date: Time.now, movie_id: movie.id)

    review.save!
  end

end

