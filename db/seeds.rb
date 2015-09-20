# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.delete_all
Review.delete_all


MOVIES = ["Taken", "Taken 2", "Taken 3"]
REVIEWERS = ["Abe", "Bob", "Cam", "Dan"]

MOVIES.each do |movie|
  m = Movie.new
  m.title = movie
  m.release_date = Date.today
  r = m.build_review
  r.reviewer_name = REVIEWERS.sample
  r.title = "Review title"
  r.review_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dignissim aliquam sapien, at vehicula arcu sagittis a. Mauris feugiat pretium nisi et ultrices. Vestibulum fringilla diam nec lacus dictum rhoncus. Curabitur sollicitudin porta nulla at semper. Etiam facilisis tincidunt fringilla. Phasellus pulvinar justo sit amet mi viverra finibus. Curabitur et purus cursus, molestie arcu ac, bibendum lacus. Vestibulum quis diam ultricies, viverra metus eu, sodales eros. Etiam sollicitudin arcu eu semper rhoncus. Integer ac quam sed neque placerat convallis."
  r.review_date = Date.today
  m.save!
end