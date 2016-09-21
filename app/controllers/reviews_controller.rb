class ReviewsController < ApplicationController
  
  def index
    @review = Review.new
    @reviews = Review.order(created_at: "desc")

    respond_to do |format|
      format.html


    end
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review created"
      
      respond_to do |format|
        format.html {redirect_to reviews_path}

        format.js { render :create_success }
      end
    else
      flash[:error] = "Something went wrong"
      
      respond_to do |format|
        format.html { redirect_to reviews_path }

        format.js { redirect_to :index }
      end

    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      flash[:success] = "Review destroyed"
      redirect_to reviews_path
    else
      flash[:error] = "Something went wrong destroying"
      redirect_to reviews_path
    end
  end


  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
  end
end
