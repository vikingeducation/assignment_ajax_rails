class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @desc_reviews = Review.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render :json => @reviews }
    end
  end
end
