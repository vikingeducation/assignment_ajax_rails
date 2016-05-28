class MoviesController < ApplicationController

  def index
    @movies = Movie.order(release_date: :desc)

    respond_to do |format|
      format.html
      format.json { render json: @movies }
    end
  end

end
