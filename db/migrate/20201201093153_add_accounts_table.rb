class AddAccountsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :customer
      t.string :accountNumber
      t.string :accountName
      t.integer :balance
      t.string :currency

      t.timestamps
    end
  end
end
