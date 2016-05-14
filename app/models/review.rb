class Review < ActiveRecord::Base

  belongs_to :movie

  validates :review_text, presence: true

end
