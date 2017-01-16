class Review < ApplicationRecord
  belongs_to :movie

  validates :reviewer_name, presence: true
end
