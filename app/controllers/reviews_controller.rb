class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order("review_date DESC")
    @review = Review.new

    respond_to do |format|
      format.html
      format.json { render json: @reviews }
    end
  end

  def show

  end

  def destroy
    @review = Review.find(params["id"])

    respond_to do |format|
      if @review.destroy
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(whitelisted_review_params)
    @review.review_date = Time.now

    respond_to do |format|
      if @review.save
        format.html { redirect_to :back rescue redirect_to reviews_path }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to root_path }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def whitelisted_review_params
    params.require(:review).permit(:title, :reviewer_name, :review_text, :movie_id)
  end
end
