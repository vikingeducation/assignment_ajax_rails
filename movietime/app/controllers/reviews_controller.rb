class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @desc_reviews = Review.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render :json => @reviews }
    end
  end

  def create

  end

  def destroy
    @review = Review.find(params[:id].to_i)
    @review.destroy
    redirect_to reviews_path
  end
end
