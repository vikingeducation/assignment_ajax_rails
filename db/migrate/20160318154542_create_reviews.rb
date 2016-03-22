class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title 
      t.string :name
      t.text   :review_text
      t.integer :movie_id
      t.timestamps null: false
    end
  end
end
