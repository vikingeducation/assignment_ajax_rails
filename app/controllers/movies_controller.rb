class MoviesController < ApplicationController

  # respond_to :html, :json

  def index
    @movie = Movie.new
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json {render :json => @movies, :status => 201}
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      @movie.release_date = @movie.created_at.strftime("%m/%d/%Y")
      @movie.save
      flash["success"] = "Your movie has been added"

      respond_to do |format|
        format.html {redirect_to root_path}
        format.js {render :movie_create}
      end
      
    else
      flash.now["error"] = "Your movie was not saved"

      respond_to do |format|
        format.html {render :index}
        format.js {render :index}
      end
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
