class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote, null: false
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
