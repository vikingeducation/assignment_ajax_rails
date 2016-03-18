class MoviesController < ApplicationController


  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render :json => @movies, :status => 201 }
    end
  end



  def create
    @movie = Movie.new(movie_params)
    @movie.release_date = Date.today - rand(100);
    if @movie.save

      respond_to do |format|
        format.html { render :index }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js
      end
    end

  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end


end
