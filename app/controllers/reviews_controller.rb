class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
    @review = Review.new
    @review_options = Movie.all.map do |movie|
        [movie.title, movie.id]
    end

  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Time.now

    if @review.save
      flash[:success] = "Review Added"

      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :create_success }
      end

    else
      flash[:error] = "Review couldn't be added"

      respond_to do |format|
        format.html { render :new }
        format.js { render :new}
      end

    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review_id = @review.id
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_path }
      # format.js { render @review }
      # format.js { }
      format.js { render :destroy }
    end
  end

  private

  def review_params
    params.require(:review)
          .permit(:reviewer_name, :title, :review_text, :movie_id)
  end

end
