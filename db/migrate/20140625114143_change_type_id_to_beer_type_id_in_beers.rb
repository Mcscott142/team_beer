class ChangeTypeIdToBeerTypeIdInBeers < ActiveRecord::Migration
  def up
    remove_column :beers, :type_id
    add_column :beers, :beer_type_id, :integer, null: false
  end

  def down
    remove_column :beers, :beer_type_id
    add_column :beers, :type_id, :integer, null: false
  end
end
