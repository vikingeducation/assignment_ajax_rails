class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.string :title
      t.text :review_text
      t.date :review_date
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
