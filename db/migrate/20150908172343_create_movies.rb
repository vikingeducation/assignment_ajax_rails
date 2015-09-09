class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.date :release_date, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
