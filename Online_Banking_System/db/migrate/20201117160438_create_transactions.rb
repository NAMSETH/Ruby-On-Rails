class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transactionNumber
      t.string :sendingAccount
      t.string :recievingAccount
      t.date :transactionDate
      t.string :currency

      t.timestamps
    end
  end
end
