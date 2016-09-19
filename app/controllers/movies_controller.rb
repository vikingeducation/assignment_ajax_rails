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
end
