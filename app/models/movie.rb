class Movie < ApplicationRecord
  has_many :reviews

  validates :title,
            :presence => true

  validates :date,
            :presence => true
end
