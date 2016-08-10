class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    @movie = Movie.new

    respond_to do |format|
      format.html

      format.json { render :json => @movies, :status => 200 }
    end
  end

  def create
    @movie = Movie.new(whitelisted_params)

    @movie.release_date = Date.today

    if @movie.save
      
      flash[:success] = "Movie created"
      respond_to do |format|
        format.json { render json: @movie, status: :created }
      end
    else
      
      flash[:error] = "Movie NOT created"
      respond_to do |format|
        format.json { render nothing: true, status: 400 }
      end
    end
  end

  private

  def whitelisted_params
    params.require(:movie).permit(:title);
  end

end
