class UserAssosiateImages < ActiveRecord::Migration
  def up
    add_column :images, :user_id, :integer, null: false, default: 0
  end
  def down
    remove_column :images, :user_id
  end
end
