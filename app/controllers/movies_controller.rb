class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html

      format.json { render json: @movies }

    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      
      flash[:success] = 'Movie successfully created'

      respond_to do |format|
        format.html { redirect_to movies_path }

        format.json { render json: @movie, status: :created }

        format.js {}
      end

    else
      flash[:error] = "Something went wrong"

      respond_to do |format|
        format.html { render :new }

        format.json { render nothing: true, status: 400 }

        format.js { render :new }
      end

    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :release_date)
  end
end
