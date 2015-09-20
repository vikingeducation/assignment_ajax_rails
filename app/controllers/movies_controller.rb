class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @movies, :status => 201 }
    end
  end



  def create
    @movie = Movie.new(movie_params)
    @movie.release_date = Date.today()

    if @movie.save
      flash[:success] = 'New movie created!'

      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render :json => @movie, :status => :created }
      end
    else
      flash.now[:error] = 'Save failed!'

      respond_to do |format|
        format.html { render :index }
        format.json { render :nothing => true, :status => 400 }
      end
    end
  end


  private

    def movie_params
      params.require(:movie).permit(:title)
    end


end

