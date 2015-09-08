class MoviesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json { render :json => @movies, :status => 201 }
    end
  end

end
