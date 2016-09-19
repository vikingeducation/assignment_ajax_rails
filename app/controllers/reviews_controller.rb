class ReviewsController < ApplicationController
  def index
    @reviews = Review.paginate(page: params[:page], per_page: 10)
    @review = Review.new
    respond_to do |format|
        format.html{}
        format.js{}
    end
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.new(2016,9,19)
    if @review.save
      flash[:success] = "Review added"
      respond_to do |format|
        format.html{redirect_to reviews_path}
        format.js{}
      end
    else
      flash[:error] = "Review added"
      render reviews_path
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted"
    respond_to do |format|
        format.html{redirect_to reviews_path}
        format.js{}
      end
  end

  private

  def review_params
    params.require(:review).permit(:reviwer_name,
      :title,
      :review_text,
      :movie_id)
  end
end
