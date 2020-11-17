class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customerNumber
      t.string :forename
      t.string :surname
      t.string :email
      t.string :phone
      t.string :password
      t.date   :dob

      t.timestamps
    end
  end
end
