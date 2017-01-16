class MoviesController < ApplicationController

  def index
    @movies = nil

    respond_to do |format|
      format.html
      format.json { render json: Movie.all }
    end
  end
end
