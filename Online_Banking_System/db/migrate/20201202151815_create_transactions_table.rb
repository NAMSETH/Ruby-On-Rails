class CreateTransactionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to "sendingAccount"
      t.belongs_to "recievingAccount"
      t.string "transactionNumber"
      t.date "transactionDate"
      t.string "currency"
      t.decimal "amount"
      t.string "description"
    end
  end
end
