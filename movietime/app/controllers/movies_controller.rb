class MoviesController < ApplicationController


  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  def create
    binding.pry

    respond_to do |format|
      format.json

    end
  end

  def show

  end
end


