class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order( created_at: :asc ).includes(:reviews)
    @movie = Movie.new

    respond_to do |format|

      # Renders the usual `index.html.erb` template
      format.html

      format.json {render json: @movies, :include => :reviews}

    end
  end


  def create
    @movie = Movie.new( movie_params )

    if @movie.save
      flash[:success] = "Movie successfully created!"

      respond_to do |format|

        # Go back to the index page
        format.html { redirect_to movies_path }

        format.json { render  json: @movie,
                              status: :created }

      end

    else # failed to create

      flash.now[:error] = "Movie could not be created"

      respond_to do |format|

        # Render the `new.html.erb` template
        format.html { render :new }

        # Just render the object directly but with
        #   an error code, no need to redirect.
        # Note that the status code should change
        #   depending on the reason why it failed
        format.json { render nothing: true,
                             status: 400 } # Bad Request

        # Re-render our New form using the
        #   `new.js.erb` template
        format.js { render :new }

      end
    end

  end


  private
  def movie_params
    params.require( :movie).permit( :title )
  end

end
