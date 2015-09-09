class MoviesController < ApplicationController

  respond_to :html, :js, :json, only: [:new]

  def index
    @movies = Movie.all
    @movie = Movie.new
    respond_to do |format|
      format.html
      format.json {render :json => @movies}
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.release_date = DateTime.now
    respond_to do |format|
      if @movie.save
        flash[:success] = "Movie was successfully created"
        format.html { redirect_to @movie }
        # format.json { render :show, status: :created}
        format.js # This renders create.js.erb
      else
        flash[:error] = @movie.errors.full_messages
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        # format.js { head :none }
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @movie}
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:name)
    end

end
