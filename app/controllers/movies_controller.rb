class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @reviews = Review.all.includes(:movie)
    @data = [@movies, @reviews]

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end
  end

  def create
    params['movie']['release_date'] = Time.now
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render nothing: true
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :release_date)
    end

end
