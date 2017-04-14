class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
    @review = Review.new
    @review_options = Movie.all.map do |movie|
        [movie.title, movie.id]
    end

  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Time.now

    if @review.save
      flash[:success] = "Review Added"

      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end

    else
      flash[:error] = "Review couldn't be added"

      respond_to do |format|
        format.html { render :new }
        format.js { render :new}
      end

    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review_id = @review.id
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_path, flash: { success: 'Review Destroyed'} }
        format.js { flash[:success] = "Review Destroyed!!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to reviews_path, flash: { error: 'Review Not Destroyed'} }
        format.js { flash.now[:error] = "Review Not Destroyed" }
      end

    end
  end

  private

  def review_params
    params.require(:review)
          .permit(:reviewer_name, :title, :review_text, :movie_id)
  end

end
