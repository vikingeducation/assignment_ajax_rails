require 'pry'

class ReviewsController < ApplicationController

  def index
    @reviews = Review.paginate(page: params[:page] || 1)
    @review = Review.new
    respond_to do |format|
      format.json { render :json => @reviews, :status => 201}
      format.html {  }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_path
  end

  def create
    @review = Review.new(whitelisted_review_params)
    @review.review_date = Time.now

    if @review.save
      respond_to :js
    end
  end

  private
    def whitelisted_review_params
      params.require(:review).permit(:title, :reviewer_name, :review_text, :movie_id)
    end
end
