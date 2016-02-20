class Review < ActiveRecord::Base

  belongs_to :movie

  validates_presence_of :title, :movie, :reviewer_name, :review_text,
                        :review_date

end
