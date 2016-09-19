class ReviewsController < ApplicationController

  def index
    @movies = Movie.all
    @reviews = Review.all.order("review_date DESC")
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    
    if @review.save
      @review.review_date = @review.created_at.strftime("%m/%d/%Y")
      @review.save
      respond_to do |format|
        flash.now[:notice] = "Review created."
        format.html { redirect_to reviews_path }
        format.js {render :create_review}
      end
      
    else
      respond_to do |format|
        flash.now[:notice] = "Error. Review not created."
        format.html { redirect_to reviews_path }
        format.js {render :index}
      end
    end

  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash.now["success"] = "Review deleted."
      redirect_to reviews_path
    else
      flash["error"] = "Error. Review not created."
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
  end

end
