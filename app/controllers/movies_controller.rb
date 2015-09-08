class MoviesController < ApplicationController
  def new
  end

  def create
    @movie = Movie.new(whitelist_movie_params)
    @movie.release_date = DateTime.now

    respond_to do |format|

      if @movie.save
        format.html { redirect_to @movie }
        format.json { render :json => @movie }
      else
        format.html { render :new }
        format.json { render :new }
      end



    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movie = Movie.new
    @movies = Movie.all

    respond_to do |format|
      format.html { render 'static_pages/json_test.html'}
      format.json { render :json => @movies, :status => 201 }
    end
  end

  private
    def whitelist_movie_params
      params.require(:movie).permit(:name)
    end

end
