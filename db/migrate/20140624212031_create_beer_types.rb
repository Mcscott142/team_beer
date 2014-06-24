class CreateBeerTypes < ActiveRecord::Migration
  def change
    create_table :beer_types do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
