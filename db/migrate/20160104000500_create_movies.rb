class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.date :date

      t.index :title
      t.index :date

      t.timestamps null: false
    end
  end
end
