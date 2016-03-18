# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ----------------------------------------
# Database Reset
# ----------------------------------------

if Rails.env == 'development'
  puts 'Reseting database'

  Rake::Task['db:migrate:reset'].invoke
end

# ----------------------------------------
# Seed Config Vars
# ----------------------------------------

MULTIPLIER = 10

# ----------------------------------------
# Seed Config Vars
# ----------------------------------------

def generate_movies
  title = Faker::StarWars.character
  release_date = Date.today - rand(100)
  Movie.create(title: title, release_date: release_date)
end

def generate_reviews
  all_movies = Movie.all

  all_movies.each do |m|
    reviewer_name = Faker::Name.name
    title = Faker::Hipster.word
    review_text = Faker::Hipster.paragraph
    review_date = Date.today - rand(100)

    3.times do
      Review.create(
        reviewer_name:reviewer_name,
        title: title,
        review_text: review_text,
        review_date: review_date,
        movie_id: m.id)
    end
  end

end

puts "Generating movies"
MULTIPLIER.times { generate_movies }
puts "Generating reviews"
generate_reviews
puts "Done~!"
