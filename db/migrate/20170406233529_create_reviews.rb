class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.string :title, null: false
      t.text :review_text

      t.datetime :review_date
      t.integer :movie_id, null: false

      t.timestamps
    end
  end
end
