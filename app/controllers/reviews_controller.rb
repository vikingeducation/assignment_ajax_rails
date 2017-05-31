class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:movie).order('review_date DESC').page(params[:page]).per_page(10)
    @review = Review.new

    respond_to do |format|
      format.html { render :index}
      format.json {render json: @reviews.as_json(include: {movie: {only: :title}}), status: :ok}
    end

  end

  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path}
        format.js do
          render :create
          flash[:success] = "Success, review created!"
        end

      end
      flash[:success] = "Success! Review created"
    else
      respond_to do |format|
        format.html { render :new}
        format.js { render :new, status: 400}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @id = params[:id]
    if @review.destroy
      respond_to do |format|
        format.html {redirect_to reviews_path}
        format.js { render :destroy, status: :ok}
      end
    else
      respond_to do |format|
        format.html { render :index}
        format.js { render :index, status: 400}
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :title, :reviewer_name, :review_text)
  end


end
