class AddIndexesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :beers, :beer_type_id
    add_index :beers, :brewery_id
    add_index :breweries, :region_id
    add_index :reviews, :user_id
    add_index :reviews, :beer_id
    add_index :votes, [:voteable_id, :voteable_type]
    add_index :votes, :user_id
  end
end
