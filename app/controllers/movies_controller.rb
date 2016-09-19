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
    @movie.release_date = Date.new(2016, 9, 19)
    if @movie.save
      respond_to html
      respond_to json { render :json => @movie }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
