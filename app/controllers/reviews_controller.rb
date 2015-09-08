class ReviewsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    review = Review.find(params[:id])
    if review && review.destroy
      flash[:success] = "successfully deleted"
      redirect_to reviews_path
    else
      flash[:error] = "failed to delete"
      redirect_to reviews_path
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @review = Review.new
    @reviews = Review.all

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @reviews, :status => 201 }
    end
  end
end
