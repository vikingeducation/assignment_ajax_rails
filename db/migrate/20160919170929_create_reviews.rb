class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|

      t.string :reviewer_name
      t.string :title
      t.string :review_text
      t.references :movie
      t.date :review_date

      t.timestamps
    end
  end
end
