class AddForeignKeyToAccountTable < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :customerNumber, :string
  end
end
