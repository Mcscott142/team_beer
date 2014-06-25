class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :region_id, null: false
      t.string :city
      t.string :state
      t.string :url
      t.string :image
      t.timestamps
    end
  end
end
