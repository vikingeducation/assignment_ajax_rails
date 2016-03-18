class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json{render :json => @movies, :status => 200}
    end
  end

  def create
    @movie = Movie.new

    respond_to do |format|
      if @movie.save

        # "standard" response
        format.html { redirect_to @task }

        # Redirect to the SHOW action but as a JS request
        # which SHOW will handle *as* a JS request
        format.js { redirect_to @task }

      else

        # normal HTML error handling here.
        # rerender same template
        format.html { render :new }

        # for JS, this renders an empty template
        # (a.k.a.: you get no JavaScript back)
        format.js { head :none }
      end
    end
  end

  def show
    @movie
  end

end
