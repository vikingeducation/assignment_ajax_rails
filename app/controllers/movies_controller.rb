class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    respond_to do |format|


      format.html

      format.json { render json:  @movies, status: 201 }
    end
  end


  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie created successfully.." }

        format.json { render :show, status: :created, location: @movie }

      else

        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :release_date)
    end

end
