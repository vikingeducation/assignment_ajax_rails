class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json
    end
  end


  def create
    @movie = Movie.new(strong_params)
    if @movie.save
      flash[:alert] = "MADE A MOVIE"
      redirect_to :back
    else
      flash.now[:alert] = "DID NOT MAKE A MOVIE"
      render :index
    end
  end

  private 

  def strong_params
    params.require(:movie).permit(:title)
  end

end
