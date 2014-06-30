class AddAverageRatingToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :avg_rating, :float, default: 0
  end
end
