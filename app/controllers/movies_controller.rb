class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: "DESC")

    respond_to do |format|


      format.html

      format.json { render json:  @movies, status: 201 }
    end
  end


  def create
    #binding.pry
    @movie = Movie.new(movie_params)

    if @movie.save

      @movie.release_date = @movie.created_at
      @movie.save

      respond_to do |format|
        format.html { redirect_to @movie, notice: "Movie created successfully.." }
        format.json { render json: @movie, status: :created }
      end
    else
        format.html { render :new }
        format.json { render nothing: true, status: 400 }

    end
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :release_date)
    end

end
