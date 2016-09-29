class ReviewsController < ApplicationController
  def index
    @review = Review.new
    @movies = Movie.all
    @reviews = Review.all

  end

  def create
    @review = Review.new(review_params)
    @review.review_date = Time.now
    if @review.save
      flash[:success] = "Review successfully created!"

      respond_to do |format|

        # Go back to the index page
        format.html { redirect_to reviews_path }



        # Just render a `create_success.js.erb`
        #   template directly (no redirect)
        # This template will take care of inserting
        #   the new object into the dom
        format.js { render :review_create }

      end

    else # failed to create

      flash.now[:error] = "Review could not be created"

      respond_to do |format|

        # Render the `new.html.erb` template
        format.html { redirect_to reviews_path }

        # Re-render our New form using the
        #   `new.js.erb` template
        format.js { render :new }

      end
    end

  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to reviews_path
    end
  end

  def review_params
      params.require( :review ).permit( :reviewer_name, :title, :review_text, :movie_id)
  end
end
