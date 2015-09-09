class ReviewsController < ApplicationController

  def new
  end

  def create
    @review = Review.new(whitelist_review_params)
    @review.date = DateTime.now

    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path }
        format.js   { render :index }
      else
        format.html { render :index }
        format.js   { render :index }
      end
    end
  end

  def destroy
    review = Review.find(params[:id])

    respond_to do |format|
      if review && review.destroy
        flash[:success] = "successfully deleted"
        format.html { redirect_to reviews_path }
        format.js {}
      else
        flash[:error] = "failed to delete"
        format.html { redirect_to reviews_path }
        format.js { render :delete }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @review = Review.new
    @reviews = Review.order(date: :desc)

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @reviews, :status => 201 }
    end
  end

  private

    def whitelist_review_params
      params.require(:review).permit(:reviewer_name, :title, :text, :movie_id)
    end
end
