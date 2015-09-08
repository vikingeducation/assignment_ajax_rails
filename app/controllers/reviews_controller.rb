class ReviewsController < ApplicationController

def index
  @reviews = Review.all
  @review = Review.new
  respond_to do |format|
    format.html {}
    format.json {render :json => @reviews}
  end
end

def new

end

end
