class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.new(2016,9,19)
    if @review.save
      respond_to do |format|
        format.html{redirect_to reviews_path}
        format.js{}
      end
    else
      render reviews_path
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
        format.html{redirect_to reviews_path}
        format.js{}
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
