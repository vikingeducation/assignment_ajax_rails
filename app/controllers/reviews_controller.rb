class ReviewsController < ApplicationController
  def index
    @review = Review.new(review_date: Date.today)
    @reviews = Review.all.order("review_date DESC")
    respond_to do |format|
      format.html
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path }
      end
    else
      respond_to do |format|
        format.html { render :index }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    respond_to do |format|
      format.html { redirect_to reviews_path }
    end
  end

  private
    def review_params
      params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id, :review_date)
    end
end
