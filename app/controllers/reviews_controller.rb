class ReviewsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @reviews = Review.all

    respond_to do |format|
      format.html { render 'static_pages/json_test.html'}
      format.json { render :json => @reviews, :status => 201 }
    end
  end
end
