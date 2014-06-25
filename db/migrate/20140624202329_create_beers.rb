class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.integer :brewery_id, null: false
      t.integer :type_id, null: false
      t.text :description, null: false
      t.string :image
      t.float :alchohol_content
      t.timestamps
    end
  end
end
