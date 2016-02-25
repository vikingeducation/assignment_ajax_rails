class MoviesController < ApplicationController
  before_action :set_movie, :only => [:show]


  def index
    @movie = Movie.new
    @movies = Movie.order(:date => :desc)
    respond_to do |format|
      format.html
      format.json { render :json => @movies.to_json, :status => 200 }
    end
  end


  def show
  end


  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      respond_to do |format|
        flash[:success] = 'Movie created!'
        format.html { redirect_to movies_path }
        format.json { render :json => @movie.to_json, :status => 200, :flash => flash }
      end
    else
      flash[:error] = 'Movie not created: ' +
        @movie.errors.full_messages.join(', ')
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render :json => @movie.to_json, :status => 422, :flash => flash }
      end
    end
  end


  private
  def set_movie
    @movie = Movie.find_by_id(params[:id])
    unless @movie
      flash[:error] = 'Movie not found'
      redirect_to :back
    end
  end


  def movie_params
    params.require(:movie)
      .permit(
        :title,
        :date
      )
  end
end
