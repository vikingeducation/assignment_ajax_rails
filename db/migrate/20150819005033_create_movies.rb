class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date

      t.timestamps null: false
    end
  end
end
