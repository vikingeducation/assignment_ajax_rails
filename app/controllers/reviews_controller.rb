class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path}
        format.js { render :create_success }
      end
    else
      respond_to do |format|
        format.html { render :new}
        format.js { render :new}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      respond_to do |format|
        format.html {redirect_to reviews_path}
        format.js { redirect_to reviews_path}
      end
    else
      respond_to do |format|
        format.html { render :index}
        format.js { render :index}
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :title, :reviewer_name, :review_text)
  end

end
