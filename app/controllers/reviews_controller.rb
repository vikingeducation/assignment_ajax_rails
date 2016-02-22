class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @review = Review.new
  end

  
  def create
    @review = Review.new( review_params )
    @review.review_date = DateTime.now

    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end
      
    else
      respond_to do |format|
        format.html { @reviews = Review.all 
                      render :index }
        format.js {}
      end

    end
  end


  def destroy
    @review = Review.find_by_id( params[:id] )

    if @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :destroy_success }
      end
    else
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js {}
      end
    end
  end


  private


  def review_params
    params.require(:review).permit(:movie_id, :reviewer_name, :title,
                                   :review_text)
  end

end
