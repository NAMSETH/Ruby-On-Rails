class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customerNumber
      t.string :forename
      t.string :surname
      t.string :email
      t.string :phone
      t.date   :dob
      t.timestamps
      t.string :password_digest
    end
  end
end
