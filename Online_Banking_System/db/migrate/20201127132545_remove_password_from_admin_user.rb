class RemovePasswordFromAdminUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :admin_users, :password, :string
  end
end
