class ReviewsController < ApplicationController

  def index
    @reviews = Review.all;
    @review = Review.new;

    respond_to do |format|

      format.html

      format.js

    end
  end

  def create
    @review = Review.new( review_params )

    if @review.save
      respond_to do |format|

        format.html { redirect_to reviews_path }

        format.js { render :index }

      end
    else
      respond_to do |format|

        format.html

        format.js

      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      respond_to do |format|

        format.html { redirect_to reviews_path }

        format.js

      end
    else
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit( :title, :name, :review_text, :movie_id )
  end
end
