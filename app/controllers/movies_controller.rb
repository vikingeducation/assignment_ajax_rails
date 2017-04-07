class MoviesController < ApplicationController
  # respond_to :html, :js   # all actions covered
  # respond_to :json, :only => [:create, :show]
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render json: @movies, status: 201 }
    end
  end

end
