class AddIndexToMovieid < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, :movie_id
  end
end
