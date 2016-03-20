class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
  end

end
