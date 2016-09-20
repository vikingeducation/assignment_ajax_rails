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

      respond_to do |format|
        flash.now[:notice] = "Your movie has been added"
        format.html {redirect_to root_path}
        #format.js {render :movie_create}
        format.json {render json: @movie, :status => :created}
      end
      
    else
      respond_to do |format|
        flash.now[:notice] = "Your movie was not saved"
        format.html {render :index}
        #format.js {render :index}
        format.json {render nothing: true, status: 400 }
      end
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
