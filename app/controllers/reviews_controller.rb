class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    @movies = Movie.all
    respond_to do |format|
      format.html
    end
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name,
                                   :title,
                                   :review_text,
                                   :review_date,
                                   :movie_id)
  end
end
