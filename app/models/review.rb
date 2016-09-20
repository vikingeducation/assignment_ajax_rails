class Review < ApplicationRecord
  belongs_to :movie

  self.per_page = 10
end
