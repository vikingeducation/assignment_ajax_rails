# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  m = Movie.new
  m.name = Faker::Lorem.sentence(3, false, 3)
  m.release_date = Faker::Date.between(50.years.ago, Date.today)
  m.save!
end

Movie.all.each do |movie|
  10.times do
    Review.create(
      movie_id: movie.id,
      reviewer_name: Faker::Name.name,
      title: Faker::Lorem.sentence(3, false, 3),
      review_text: Faker::Lorem.paragraphs,
      review_date: Faker::Date.between(5.years.ago, Date.today)
    )
  end
end
