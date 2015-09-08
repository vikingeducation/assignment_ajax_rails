class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
    @review = Review.new
    respond_to do |format|
      format.html {}
      format.json {render :json => @reviews}
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        flash[:success] = "Review created"
        format.html { redirect_to reviews_path }
        format.js
      else
        flash[:error] = @review.errors.full_messages.first
        format.html { render :new }
        format.js { head :none }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "You've successfully deleted this review"
    redirect_to reviews_path
  end

  private

    def review_params
      params.require(:review).permit(:reviewer_name, :title, :text, :movie_id)
    end

end
