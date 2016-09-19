class MoviesController < ApplicationController



  def index
    @movies = Movie.paginate(:page => params[:page], :per_page => 10)
    @movie = Movie.new
    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.new(whiteListedMovieParams)
    @movie.release_date = Time.now
    if @movie.save
        render json: @movie
    end
  end

  private

    def whiteListedMovieParams
      params.require(:movie).permit(:title)
    end
end
