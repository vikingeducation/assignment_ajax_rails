class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    @movies = Movie.all
    formatted_reviews = @reviews.map do |review|
      {title: review.title,
        movie: review.movie.title,
        reviewer_name: review.reviewer_name,
        review_text: review.review_text,
        review_date: review.review_date
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: formatted_reviews, status: 200 }
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash.now[:success] = "Review created"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end
    else
      flash.now[:error] = "Review couldn't be created"
      respond_to do |format|
        format.html { render :index }
        format.js { render :index }
      end
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name,
                                   :title,
                                   :review_text,
                                   :review_date,
                                   :movie_id)
  end
end
