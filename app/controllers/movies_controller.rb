class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all.order(:release_date => :desc)

    respond_to do |format|
      format.html
      format.json { render :json => @movies, :status => 201 }
    end
  end

  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      respond_to do |format|
        # format.html { redirect_to movies_path }
        # Render the object directly, no need to redirect
        format.json { render json: @movie, status: :created }
      end
    else
      respond_to do |format|

        # Don't render anything, just return bad request code
        format.json { render nothing: true, status: 400 }
      end
    end

  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date)
  end
end
