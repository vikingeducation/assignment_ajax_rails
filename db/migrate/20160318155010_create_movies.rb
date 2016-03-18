class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.datetime :release_date, null: false

      t.timestamps null: false
    end
  end
end
