class MoviesController < ApplicationController

	def index
		@movies = Movie.all

		respond_to do |format|
			format.html
			format.json {render :json => @movies, :status => 200}
    end	
	end

	def create
		@movie = Movie.new( movie_params )
		@movie.release_date = Time.now

		respond_to do |format|

			if @movie.save

				format.html { redirect_to @movie }
				format.js { render :create_success }

			else

				format.html { render :new }
				format.js { head :none }

			end

		end
	end

private
  def movie_params
    params.require( :movie ).permit( :title )
  end

end
