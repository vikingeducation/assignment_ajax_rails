class ReviewsController < ApplicationController

  def index
    @movies = Movie.all
    @new_review = Review.new
    @reviews = Review.all.order(:review_date => :desc)
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.today

    if @review.save
      flash[:success] = 'Review saved successfully!'
      redirect_to reviews_path
    else
      flash.now[:error] = 'Save failed!'
      render :index
    end
  end


  def destroy
    @review = Review.find(params[:id])

    if @review.destroy!
      flash[:success] = 'Review deleted!'
      redirect_to reviews_path
    else
      flash.now[:error] = 'Delete failed!'
      render :index
    end
  end


  private

    def review_params
      params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
    end

end
