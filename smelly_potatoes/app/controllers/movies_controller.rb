class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json
    end
  end


end
