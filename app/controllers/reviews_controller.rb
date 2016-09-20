class ReviewsController < ApplicationController

  def index

    @reviews = Review.order(created_at: :desc)
    @review = Review.new
    respond_to do |format|
      format.html
      format.json { render json: @reviews }
    end
  end

  def create
    @review = Review.new(whiteListedReviewParams)
    @review.review_date = Time.now
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js {render :create_review }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js 
      end
    else
      render :index
    end
  end

  private

    def whiteListedReviewParams
      params.require(:review).permit(:title, :reviewer_name, :review_text, :movie_id)
    end
end
