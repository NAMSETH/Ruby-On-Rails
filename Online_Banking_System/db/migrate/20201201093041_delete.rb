class Delete < ActiveRecord::Migration[6.0]
  def change
    drop_table :accounts
  end
end
