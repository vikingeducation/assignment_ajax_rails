class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = Review.new(whitelisted_params)
    @review.review_date = Date.today
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path }
        format.js { redirect_to reviews_path }
      else
        format.html { render :index }
      end
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.destroy
        format.html { redirect_to reviews_path }
      else
        format.html { render :index }
      end
    end
  end

  private

  def whitelisted_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :review_date, :movie_id)
  end
end
