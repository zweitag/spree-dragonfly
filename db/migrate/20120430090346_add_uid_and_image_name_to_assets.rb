class AddUidAndImageNameToAssets < ActiveRecord::Migration
  def change
    add_column :spree_assets, :attachment_uid, :string
    add_column :spree_assets, :attachment_image_name, :string
    add_index :spree_assets, :attachment_uid
  end
end
