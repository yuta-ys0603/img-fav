class UserAssosiateImages < ActiveRecord::Migration
  def up
    add_column :images, :user_id, :integer, null: false
  end
  def down
    remove_column :images, :user_id
  end
end
