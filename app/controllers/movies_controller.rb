class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order( created_at: :desc )

    respond_to do |format|

      # Renders the usual `index.html.erb` template
      format.html

      format.json { render json: @movies }

    end
  end 


  def create
    @movie = Movie.new( movie_params )

    if @Movie.save
      flash[:success] = "Movie successfully created!"

      respond_to do |format|

        # Go back to the index page
        format.html { redirect_to movies_path }

        # Just render the object directly, no need
        #   to redirect
        format.json { render  json: @movie, 
                              status: :created }

      end

    else # failed to create

      flash.now[:error] = "Post could not be created"

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
  def post_params
    params.require( :post ).permit( :title, :body )
  end

end



end
