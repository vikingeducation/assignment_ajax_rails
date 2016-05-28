class ReviewsController < ApplicationController

  def index
    @reviews = Review.order(:review_date => :desc).includes(:movie)
    @movies = Movie.order(:title)
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.today

    if @review.save
      flash[:success] = "Review saved!"

      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js {}
      end
    else
      flash[:error] = "Oops, could not save review. Please fill in all fields."

      respond_to do |format|
        # TODO: fix this so that it re-renders instead (can't access @movies)
        format.html { redirect_to reviews_path }
        format.js {}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      flash[:success] = "Review deleted."

      respond_to do |format|
        format.html { redirect_to reviews_path }
      end
    else
      flash[:error] = "Oops. Could not delete review."

      respond_to do |format|
        format.html { redirect_to reviews_path }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
  end
end
