class MoviesController < ApplicationController
  # respond_to :html, :js   # all actions covered
  # respond_to :json, :only => [:create, :show]
  def index
    @movies = Movie.all.order(created_at: :desc)
    @movie = Movie.new

    respond_to do |format|
      format.html
      format.json { render json: @movies, status: 201 }
      # format.js
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.release_date = Time.now

    if @movie.save
      flash[:success] = "Movie Added"

      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render json: @movie,
                            status: :created }
        # format.js { render :index } #aka index.js.erb
      end

    else
      flash[:error] = "Movie Couldn't Be Added"

      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render nothing: true,
                            status: 400 }
        # format.js { render :#asdf.js.erb}
      end

    end
  end

  private
    def movie_params
      params.require(:movie)
            .permit(:title)
    end

end
