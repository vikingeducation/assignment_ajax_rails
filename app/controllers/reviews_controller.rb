class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:movie).order(review_date: :desc)
    @movies = Movie.all
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.today
    if @review.save
      flash[:success] = "Review successfully created!"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :review_create }
      end
    else
      flash.now[:error] = "Review could not be created"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :new }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      flash[:success] = "Review deleted!"
    else
      flash[:danger] = "Unable to delete this review post!"
    end
    respond_to do |format|
      format.html { redirect_to reviews_path }
      format.js { render :review_delete }
    end
  end

  private
  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text,
                                   :review_date, :movie_id)
  end
end
