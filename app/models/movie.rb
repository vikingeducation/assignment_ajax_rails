class Movie < ApplicationRecord
  #after_create :create_release_date

  has_many :reviews


  def create_release_date
    self.create_release_date = self.created_at
  end

end
