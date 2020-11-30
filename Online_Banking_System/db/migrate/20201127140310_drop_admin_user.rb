class DropAdminUser < ActiveRecord::Migration[6.0]
  def change
    drop_table :admin_users
  end
end
