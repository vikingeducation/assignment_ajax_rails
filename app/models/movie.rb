class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  after_create :set_release_date

  def release_date_p
    self.release_date.strftime("%-d/%m/%Y")
  end

  private
  def set_release_date
    self.release_date = self.created_at
    self.save
  end

end
