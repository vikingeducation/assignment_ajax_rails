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
    @movie.release_date = Date.today
    respond_to do |format|
      if @movie.save
        flash[:alert] = "MADE A MOVIE"
        format.html {redirect_to :back}
        format.json
      else
        flash.now[:alert] = "DID NOT MAKE A MOVIE"
        format.html { render :index }
        format.json
      end
    end
  end

  private 

  def strong_params
    params.require(:movie).permit(:title)
  end

end
