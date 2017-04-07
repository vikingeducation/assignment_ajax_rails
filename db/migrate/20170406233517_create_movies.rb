class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.datetime :release_date

      t.timestamps
    end
  end
end
