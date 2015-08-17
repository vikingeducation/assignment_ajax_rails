class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @desc_reviews = Review.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render :json => @reviews }
      format.js {
        jfdkls;a
      }
    end
  end

  def create
    @review = Review.new(
          reviewer_name: params["review"]["reviewer_name"],
          movie_id: params["review"]["movie_id"].to_i,
          review_text: params["review"]["review_text"]
        )
    respond_to do |format|
      if @review.save
      # really really that's it
        format.js {}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id].to_i)
    @review_id = @review.id
    @review.destroy
    respond_to do |format|
      # really really that's it
      format.html {redirect_to reviews_path}
      format.js {}
    end
  end
end
