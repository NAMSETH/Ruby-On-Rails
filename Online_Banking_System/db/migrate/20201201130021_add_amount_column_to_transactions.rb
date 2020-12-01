class AddAmountColumnToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :amount, :decimal
  end
end
