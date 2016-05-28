class ReviewsController < ApplicationController

  def index
    @reviews = Review.order(:review_date => :desc).includes(:movie)
    @movies = Movie.order(:title)
  end

  def destroy
    # TODO: make this
  end
end
