class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @movies, :status => 201 }
    end
  end


end
