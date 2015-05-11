class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @desc_reviews = Review.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render :json => @reviews }
    end
  end

  def create
    Review.create(
      reviewer_name: params["review"]["reviewer_name"],
      movie_id: params["review"]["movie_id"].to_i,
      review_text: params["review"]["review_text"]
      )
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id].to_i)
    @review.destroy
    redirect_to reviews_path
  end
end
