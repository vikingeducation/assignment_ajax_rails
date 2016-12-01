class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:movie).order(review_date: :desc)
    @movies = Movie.all
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save

    else
      flash.now[:error] = "Review could not be created"
    end
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      flash[:success] = "Review deleted!"
    else
      flash[:danger] = "Unable to delete this review post!"
    end
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text,
                                   :review_date, :movie_id)
  end
end
