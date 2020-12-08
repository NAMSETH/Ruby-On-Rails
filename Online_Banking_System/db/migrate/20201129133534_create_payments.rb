class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :recievingAccount
      t.string :currency
      t.string :sumSended
      t.date :paymentDate

      t.timestamps
    end
  end
end
