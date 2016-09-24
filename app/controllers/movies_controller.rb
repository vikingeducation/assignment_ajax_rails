class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(release_time: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.new(white_list_params)
    if @movie.save
      @movie.release_time = @movie.created_at
      @movie.save
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render json: @movie, status: :created }
      end
    else
      flash.now[:danger] = "Movie could not be created"
      respond_to do |format|
        format.html { render :index }
        format.json { render nothing: true, status: 400 }
      end
    end
  end

  private
    def white_list_params
      params.require(:movie).permit(:title, :release_time)
    end
end
