class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name, null: false
      t.string :title, null: false
      t.text :review_text, null: false
      t.datetime :review_date, null: false
      t.integer :movie_id, null: false

      t.timestamps null: false
    end
    add_index :reviews, :movie_id
  end
end
