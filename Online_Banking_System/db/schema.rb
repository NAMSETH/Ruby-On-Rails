# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_165344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "accountNumber"
    t.string "accountName"
    t.decimal "balance", precision: 10, scale: 2
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customerNumber"
    t.string "forename"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sendingAccount_id"
    t.bigint "recievingAccount_id"
    t.string "transactionNumber"
    t.date "transactionDate"
    t.string "currency"
    t.decimal "amount", precision: 10, scale: 2
    t.string "description"
    t.index ["recievingAccount_id"], name: "index_transactions_on_recievingAccount_id"
    t.index ["sendingAccount_id"], name: "index_transactions_on_sendingAccount_id"
  end

end
