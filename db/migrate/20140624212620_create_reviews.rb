class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :beer_id, null: false
      t.timestamps
    end
  end
end
