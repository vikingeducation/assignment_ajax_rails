class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json{render :json => @movies, :status => 200}
    end
  end

  def create
    @movie = Movie.new( title: movie_params[:title] )
    @movie.release_date = Time.now
    respond_to do |format|
      if @movie.save

        format.html { redirect_to movies_path }

        # Redirect to the SHOW action but as a JS request
        # which SHOW will handle *as* a JS request
        format.json {render :json => @movie, :status => 201}
        puts @movie
        puts 'im here'

      else

        # normal HTML error handling here.
        # rerender same template
        format.html { render :new }

        # for JS, this renders an empty template
        # (a.k.a.: you get no JavaScript back)
        format.json { head :none }
      end
    end
  end

  private
  def movie_params 
    params.permit(:title)
  end

end
