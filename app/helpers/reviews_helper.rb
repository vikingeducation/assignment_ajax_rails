module ReviewsHelper

  def get_movie_title movie_id
    Movie.find_by_id(movie_id).title
  end
  
end
