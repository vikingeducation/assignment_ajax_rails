class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:date => :desc)
    respond_to do |format|
      format.html
      format.json {render :json => @movies.to_json, :status => 200}
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if (@movie.save)
      flash[:success] = 'Movie created!'
    else
      flash[:error] = 'Movie not created: ' +
        @movie.errors.full_messages.join(', ')
    end
      redirect_to movies_path
  end


  private
  def movie_params
    params.require(:movie)
      .permit(
        :title,
        :date
      )
  end
end
