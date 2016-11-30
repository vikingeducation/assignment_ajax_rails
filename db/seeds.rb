#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
Review.destroy_all

puts "creating 10 movies.."
10.times do
  Movie.create(title: Faker::Book.title, release_date: Faker::Date.between(10.years.ago, Date.today))
end

puts "creating 5 reviews for each movie"
Movie.all.each do |m|
  5.times do
    m.reviews << Review.new(reviewer_name: Faker::Name.name,
                            title: Faker::Company.catch_phrase,
                            review_text: Faker::Hipster.paragraph,
                            review_date: Faker::Date.between(m.release_date, Date.today))
  end
end