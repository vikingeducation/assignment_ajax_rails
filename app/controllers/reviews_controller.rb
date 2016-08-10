class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(review_date: :desc)

    @review = Review.new
  end

  def create
    @review = Review.new(whitelisted_params)
    @review.review_date = Date.today

    respond_to do |format|

      if @review.save
        flash["success"] = "Review Created !"

        format.html { redirect_to reviews_path }

        format.js { render :create_success }
      else
        flash["error"] = "Review NOT Created !"

        format.html { render :index }

        format.js { render :new }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash["success"] = "Review Destroyed !"
    else
      flash["error"] = "Review NOT Destroyed !"
    end
    redirect_to reviews_path
  end

  private

  def whitelisted_params
    params.require(:review).permit(:reviewer_name, :title, 
                                   :review_text, :movie_id)
  end
end
