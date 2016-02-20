class Movie < ActiveRecord::Base

  has_many :reviews

  validates_presence_of :title, :release_date

end
