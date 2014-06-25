class ChangeImageUrlToImageInUsers < ActiveRecord::Migration
  def up
    remove_column :users, :image_url
    add_column :users, :image, :string
  end

  def down
    remove_column :users, :image
    add_column :users, :image_url, :string
  end
end
