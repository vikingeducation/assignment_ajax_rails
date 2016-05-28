class MoviesController < ApplicationController

  def index
    @movies = Movie.order(:release_date)

    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.release_date = Date.today

    if @movie.save
      flash[:success] = "Movie successfully saved!"

      respond_to do |format|
        # Render the object directly, no need to redirect
        format.json { render json: @movie, status: :created }
      end
    else
      respond_to do |format|
        # Don't render anything, just return bad request code
        format.json { render nothing: true, status: 400 }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
