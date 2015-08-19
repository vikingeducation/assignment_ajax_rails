class ReviewsController < ApplicationController
  respond_to :html, :js
  respond_to :json, only: :index

  def index
    @reviews = Review.all
  end
end
