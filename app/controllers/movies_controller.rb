class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movie = Movie.new

    respond_to do |format|
      format.html

      #building full json response
      #rails runs to_json on object passed in
      format.json { render :json => @movies, :status => 201}
    end
  end

  def create
    @movie = Movie.new(whitelisted_movie_params)
    

    respond_to do |format|
      if @movie.save
       format.json { render :json => @movie, status: :created, location: @movie}
      end
    end
  end


  private
    def whitelisted_movie_params
      params.require(:movie).permit(:title, :release_date)
    end

end
