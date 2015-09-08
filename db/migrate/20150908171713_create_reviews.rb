class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :movie
      t.string :title
      t.string :reviewer_name
      t.text :text
      t.date :date
      t.timestamps null: false
    end
  end
end
