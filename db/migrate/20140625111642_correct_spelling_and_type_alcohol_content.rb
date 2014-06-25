class CorrectSpellingAndTypeAlcoholContent < ActiveRecord::Migration
  def up
    add_column :beers, :alcohol_content, :string
  end

  def down
    remove_column :beers, :alchohol_content
  end
end
