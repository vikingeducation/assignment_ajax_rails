class ReviewsController < ApplicationController

  respond_to :html, :json

  def index
    @reviews = Review.all

    respond_to |format|
      format.html
      format.json { render :json => @reviews }
    end
  end
end
