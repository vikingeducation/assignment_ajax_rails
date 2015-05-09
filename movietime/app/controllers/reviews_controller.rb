class ReviewsController < ApplicationController

  def index
    @reviews = Review.all

    respond_to do |format|
      format.html
      format.json { render :json => @reviews }
    end
  end
end
