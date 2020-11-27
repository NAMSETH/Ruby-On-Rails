class ChangePasswordToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :password, :password_digest
  end
end
