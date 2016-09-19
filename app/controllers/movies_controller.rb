class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie = Movie.new
    respond_to do |format|
      format.html {}
      format.json { render json: @movies, status: 200 }
    end
  end

  def create
    @movie = Movie.new(whitelisted_params)
    respond_to do |format| 

      if @movie.save 
        format.html { redirect_to @movie }
        format.json { render json: @movie, status: 200 }
      else
        fail
      end

    end
  end


  private

  def whitelisted_params
    params.require(:movie).permit(:title)
  end
end
