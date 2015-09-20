class Movie < ActiveRecord::Base
  has_one :review
end
