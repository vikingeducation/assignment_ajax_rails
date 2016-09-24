class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:movie).all.order( review_date: :desc )
    respond_to do |format|
      format.html
    end
  end

  def create
    @review = Review.new(white_list_param)
    if @review.save
      @review.review_date = @review.created_at
      @review.save
      flash.now[:success] = "create success"
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_review }
      end
    else
      respond_to do |format|
        flash.now[:danger] = "Review can not be created"
        format.html { render :index }
      end
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if @review && @review.destroy
      flash[:success] = "The review has been deleted"
    else
      flash[:danger] = "Something wrong, the review can not be deleted"
    end
    redirect_to reviews_path
  end

  private
    def white_list_param
      params.require(:review).permit(:reviewer_name,
                                     :review_text,
                                     :movie_id,
                                     :title)
    end
end
