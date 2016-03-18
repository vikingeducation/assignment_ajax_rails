class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movie = Movie.new
    respond_to do |format|
      format.html
      format.json { render json: @movies, status: 201 }
      format.js {}
    end
  end

  def create
    @movie = Movie.new(whitelisted_params)
    @movie.release_date = Date.today

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie }
        format.json { redirect_to @movie }
      else
        format.html { render :index }
        format.json { head :none }
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.json { render json: @movie, status: 201 }
    end
  end

  private

  def whitelisted_params
    params.require(:movie).permit(:title, :release_date)
  end
end
