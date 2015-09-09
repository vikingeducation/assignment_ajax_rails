class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.integer :movie_id, null: false

      t.timestamps null: false
    end
  end
end
