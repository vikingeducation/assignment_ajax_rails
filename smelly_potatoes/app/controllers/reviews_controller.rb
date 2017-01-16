class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(review_date: :desc)
    @movies = Movie.all
  end

  def create
    @review = Review.new(strong_params)
    @review.review_date = Date.today
    respond_to do |format|
      if @review.save
        format.html {redirect_to reviews_path}
        format.js {render :create_success}
        flash[:alert] = "MADE A REVIEW. YAY"
      else
        format.html {render :index}
        format.js {render :index}
        flash.now[:alert] = "You failed to review"
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:alert] = "You have wrought devastation. Well done."
      redirect_to reviews_path
    else
      flash.now[:alert] = "Mercy is weakness!"
      render :index 
    end
  end

  private
  def strong_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
  end

end
