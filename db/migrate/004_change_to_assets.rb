class ChangeToAssets < ActiveRecord::Migration
  def self.up
    remove_column :banners, :background_image
    remove_column :banners, :foreground_image
    add_column :banners, :asset_id, :integer
  end

  def self.down
    remove_column :banners, :asset_id
    add_column :banners, :background_image
    add_column :banners, :foreground_image
  end
end