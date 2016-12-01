class ChangeMoviesNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:movies, :title, false)
  end
end
