class MoviesController < ApplicationController

def index
  @movies = Movie.all
  respond_to do |format|
    format.html
    format.json {render '/json_test.html'}
  end
end

end
