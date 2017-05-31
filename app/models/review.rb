class Review < ApplicationRecord
  belongs_to :movie
  after_create :set_review_date

  private

  def set_review_date
    self.review_date = self.created_at
    self.save
  end
end
