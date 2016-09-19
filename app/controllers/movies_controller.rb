class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie = Movie.new

    respond_to do |format|
      format.html
      format.json{render :json => @movies}
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      respond_to do |format|
        format.html
        format.json { render :json => @movie }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date)
  end

end
