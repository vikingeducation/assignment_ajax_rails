class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render reviews_path
    end

  end

  private

  def review_params
    params.require(:review).permit(:reviwer_name,
      :title,
      :review_text,
      :movie_id)
  end
end
