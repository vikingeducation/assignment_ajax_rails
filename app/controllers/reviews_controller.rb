class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = Review.new(whitelisted_params)
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def whitelisted_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :review_date, :movie_id)
  end
end
