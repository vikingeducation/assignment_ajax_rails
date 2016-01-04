class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.date :date
      t.string :reviewer
      t.integer :movie_id

      t.index :title
      t.index :date
      t.index :reviewer
      t.index :movie_id

      t.timestamps null: false
    end
  end
end
