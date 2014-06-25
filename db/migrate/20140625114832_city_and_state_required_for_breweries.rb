class CityAndStateRequiredForBreweries < ActiveRecord::Migration
  def change
    change_column :breweries, :city, :string, null: false
    change_column :breweries, :state, :string, null: false
  end
end
