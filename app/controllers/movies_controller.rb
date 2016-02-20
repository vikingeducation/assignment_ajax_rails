class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movie = Movie.new

    respond_to do |format|
      format.html {}
      format.json { render json: @movies }
    end
  end
  

  def create
    @movie = Movie.new( movie_params )
    @movie.release_date = DateTime.now

    if @movie.save
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render json: @movie, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.json { render nothing: true, status: 400 }
      end
    end
  end


  private


  def movie_params
    params.require(:movie).permit(:title)
  end
end
