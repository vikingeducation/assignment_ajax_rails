class ReviewsController < ApplicationController

  def index
    @reviews = Review.order(created_at: "DESC")
  end

  def create
    @review = Review.new(movie_params)

    respond_to do |format|
      if @review.save
          @review.review_date = @review.created_at
          @review.save
        format.html { redirect_to reviews_path, notice: 'Review was successfully created.' }
        format.js { render :create }
      else
        format.html { render :new }
        format.js { head :none }
      end
    end

  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_path

  end

  private
    def movie_params
      params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
    end
end
