class AddVoteCountToObjects < ActiveRecord::Migration
  def change
    add_column :beers, :vote_count, :integer, default: 0
    add_column :reviews, :vote_count, :integer, default: 0
  end
end
