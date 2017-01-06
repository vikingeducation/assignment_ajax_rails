class ReviewsController < ApplicationController

  def index
    @reviews = Review.order(created_at: "DESC")
  end


  def create
    @review = Review.new(movie_params)

    if @review.save
      flash[:success] = "Post successfully created!"

      @review.review_date = @review.created_at
      @review.save

      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end
    else
      flash.now[:error] = "Post could not be created"

      respond_to do |format|
        format.html { render :new }
        format.js { render :new}
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
