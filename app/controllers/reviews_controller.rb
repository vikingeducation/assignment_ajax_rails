class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    respond_to do |format|
      format.html
      format.json { render json: @movies, status: 200 }
    end
  end
end
