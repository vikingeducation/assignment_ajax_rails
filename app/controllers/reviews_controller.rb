class ReviewsController < ApplicationController

	def index
		@reviews = Review.all

	end

	def create
		@review = Review.new( review_params )
		@review.review_date = Time.now

		respond_to do |format|

			if @review.save

				format.html { redirect_to @review }
				format.js { render :create_success }

			else

				format.html { render :index }
				format.js { head :none }

			end
		end
	end

	def destroy
		@review = Review.find(params[:id])

		respond_to do |format|

			if @review.destroy

				format.html { redirect_to reviews_path }
				format.js { render :destroy_success }

			else

				format.html { render :index }
				format.js { head :none }

			end

		end

	end

private
	def review_params
    params.require( :review ).permit( :reviewer_name, :title, :review_text, :movie_id )
  end
end
