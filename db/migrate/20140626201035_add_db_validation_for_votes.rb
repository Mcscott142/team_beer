class AddDbValidationForVotes < ActiveRecord::Migration
  def change
    remove_index :votes, [:user_id]
    remove_index :votes, [:voteable_id, :voteable_type]
    add_index :votes, [:user_id, :voteable_id, :voteable_type], unique: true
  end
end
