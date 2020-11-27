class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.timestamps
      t.string :password
    end
  end
end
