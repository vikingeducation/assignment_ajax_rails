class Movie < ActiveRecord::Base
	# Add Associations
	has_many :reviews
end
