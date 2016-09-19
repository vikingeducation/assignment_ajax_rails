class MoviesController < ApplicationController



  def index
    @movies = Movie.all
    @movie = Movie.new
    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.new(whiteListedMovieParams)
    if @movie.save
        render json: @movie
    end
  end

  private

    def whiteListedMovieParams
      params.require(:movie).permit(:title)
    end
end
