class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    @movies = Movie.all
    respond_to do |format|
      format.html
    end
  end
end
