class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @movies = Movie.all
  end

end
