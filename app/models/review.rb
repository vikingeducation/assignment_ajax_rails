class Review < ActiveRecord::Base
  belongs_to :movie

  validates_presence_of :reviewer_name, :title, :review_text, :movie
end
