class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
    @new_review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Time.now

    if @review.save
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end



  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :review_date, :movie_id)
  end

end
