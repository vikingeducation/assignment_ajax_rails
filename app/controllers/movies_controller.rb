class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.new( name: params["name"],
                        release_date: params["release_date"]
    )

    respond_to do |format|
      if @movie.save
        format.html { redirect_to root_path }
        format.json { render json: @movie }
      end
    end
  end


  private

  def whitelisted_movie_params
    params.require(:movie).permit(:name, :release_date)
  end
end
