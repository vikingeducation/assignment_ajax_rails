class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @movies, :status => 201 }
    end
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path }
        format.json { render json: @movie, status: :created }
      else
        flash.now[:error] = "Movie could not be created"
        format.html { redirect_to movies_path }
        format.json { render nothing: true, status: 400 }
      end
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_date)
  end

end
