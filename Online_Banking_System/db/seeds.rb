# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.destroy_all
#Customer.destroy_all
#Account.destroy_all
#Transaction.destroy_all

AdminUser.new(email:"admin@gmail.com", password:"admin123",
  password_confirmation: "admin123")
customer = Customer.new(customerNumber: 1, email: "fakeCompanies123@hotmail.com",
     forename: "Fake", surname: "Companies", phone: "44123451234",
     dob: "10/11/1996", password: "12345678", password_confirmation: "12345678")
accountList = [Accounts.new(accountNumber:1, accountName:"Sainsbury's", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:2, accountName:"TfL", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:3, accountName:"Amazon", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:4, accountName:"", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:5, accountName:"", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:6, accountName:"", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:7, accountName:"", balance: 1234.56, currency: "GBP"),
  Accounts.new(accountNumber:8, accountName:"", balance: 1234.56, currency: "GBP")]
country_list.each do
  customer << Accounts.new
