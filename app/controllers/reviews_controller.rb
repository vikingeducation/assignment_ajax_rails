class ReviewsController < ApplicationController
  def index
    @review = Review.new(review_date: Date.today)
    @reviews = Review.all.order("review_date DESC")
    respond_to do |format|
      format.html
      format.js { render :index }
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Review saved"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end
    else
      flash[:error] = "Review could not be saved"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :index }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    flash[:success] = "Review destroyed"
    respond_to do |format|
      format.html { redirect_to reviews_path }
      format.js { render :delete_success }
    end
  end

  private
    def review_params
      params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id, :review_date)
    end
end
