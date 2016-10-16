class Review < ApplicationRecord
  belongs_to :movie

  validates :title,
            :presence => true

  validates :body,
            :presence => true

  validates :date,
            :presence => true

  validates :reviewer,
            :presence => true

  validates :movie,
            :presence => true
end
