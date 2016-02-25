class ReviewsController < ApplicationController
  before_action :set_review, :only => [:show, :destroy]


  def index
    @review = Review.new
    @reviews = Review.order(:date => :desc)
  end


  def show
  end


  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path, :flash => { :success => 'Review created' } }
        format.js  do
          flash.now[:success] = 'Review created'
          render :index
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to reviews_path, :flash => { :error => 'Review not created' } }
        format.js do
          flash.now[:error] = 'Review not created'
          render :index
        end
      end
    end
  end


  def destroy
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_path, :flash => { :success => 'Review destroyed' } }
        format.js { flash[:success] = 'Review destroyed' }
      end
    else
      respond_to do |format|
        format.html { redirect_to reviews_path, :flash => { :error => 'Review not destroyed' } }
        format.js { flash.now[:error] = 'Review not destroyed' }
      end
    end
  end




  private
  def set_review
    @review = Review.find_by_id(params[:id])
    unless @review
      flash[:error] = 'Review not found'
      redirect_to :back
    end
  end


  def review_params
    params.require(:review).permit(
      :title,
      :body,
      :date,
      :reviewer,
      :movie_id
    )
  end
end
