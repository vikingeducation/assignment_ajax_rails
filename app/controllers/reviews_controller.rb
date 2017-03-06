class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(review_date: :desc)
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)

    if @review.save
      flash[:success] = "Saved!"
      respond_to do |format|
        format.js { }
      end
    else
      flash[:warning] = "Error!"
      respond_to do |format|
        format.js { head :none }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = "Deleted!"
      redirect_to reviews_path
    else
      flash[:warning] = "Error!"
    end
  end

  private

  def reviews_params
    params.require(:review).permit( :reviewer_name,
                                    :title,
                                    :review_text,
                                    :movie_id,
                                    :review_date )
  end
end
