class ReviewsController < ApplicationController

  def index
    @movies = Movie.all
    @new_review = Review.new
    @reviews = Review.all.order(:review_date => :desc)
  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Date.today

    if @review.save
      flash[:success] = 'Review saved successfully!'
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end
    else
      flash.now[:error] = 'Save failed!'
      respond_to do |format|
        format.html { render :index }
        format.js { render :nothing => true, :status => 400 }
      end
    end
  end


  def destroy
    @review = Review.find(params[:id])

    if @review.destroy!
      flash[:success] = 'Review deleted!'
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :destroy_success }
      end
    else
      flash.now[:error] = 'Delete failed!'
      respond_to do |format|
        format.html { render :index }
        format.js { render :nothing => true, :status => 400 }
      end
    end
  end


  private

    def review_params
      params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
    end

end
