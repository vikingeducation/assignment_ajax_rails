class Review < ActiveRecord::Base
	# Add Associations
	belongs_to :movie
end
