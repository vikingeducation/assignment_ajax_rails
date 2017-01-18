class MoviesController < ApplicationController

  def index
    @movie = Movie.new(title: "", release_date: Date.today)
    @movies = nil

    respond_to do |format|
      format.html
      format.json { render json: Movie.all }
    end
  end

  def create
    @movie = Movie.new(movie_params)
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
      params.require(:movie).permit(:title, :release_date)
    end
end
