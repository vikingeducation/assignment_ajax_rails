class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    params['review']['review_date'] = Time.now
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :new }
      end
    else
      render :index
    end
  end

  def destroy
    if @review = Review.find_by_id(params[:id])
      @review.destroy
    end
    redirect_to reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :review_date, :movie_id)
  end
end
