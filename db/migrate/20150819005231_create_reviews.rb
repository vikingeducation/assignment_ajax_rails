class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.string :title
      t.string :review_text
      t.datetime :review_date
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
