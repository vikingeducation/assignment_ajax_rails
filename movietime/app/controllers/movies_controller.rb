class MoviesController < ApplicationController


  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  def create
    respond_to :html, :js
    @new_movie = Movie.create(
        name: params["movie"]["name"],
        release_date: params["movie"]["release_date"]
      )
    respond_to do |format|
      format.json { render :json => @new_movie }
    end
  end

  def show

  end
end


