class ChangePasswordToPasswordDigestAdmin < ActiveRecord::Migration[6.0]
  def change
    rename_column :admin_users, :password, :password_digest
  end
end
