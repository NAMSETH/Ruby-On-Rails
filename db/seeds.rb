# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#default admin
AdminUser.new(email:"admin@gmail.com", password:"admin123",
  password_confirmation: "admin123").save

#Fake company customer and its accounts
customer = Customer.new(customerNumber: 1, email: "fakeCompanies123@gmail.com",
     forename: "Fake", surname: "Companies", phone: "44123451234",
     dob: "10/11/1996", password: "12345678", password_confirmation: "12345678")
customer.save
accountList = [Account.new(accountNumber:1, accountName:"Supermarket", balance: 0, currency: "GBP"),
  Account.new(accountNumber:2, accountName:"Transport", balance: 0, currency: "GBP"),
  Account.new(accountNumber:3, accountName:"E-commerce", balance: 0, currency: "GBP"),
  Account.new(accountNumber:4, accountName:"Chemist", balance: 0, currency: "GBP"),
  Account.new(accountNumber:5, accountName:"Cafe", balance: 0, currency: "GBP"),
  Account.new(accountNumber:6, accountName:"Gym membership", balance: 0, currency: "GBP"),
  Account.new(accountNumber:7, accountName:"Clothing retailer", balance: 0, currency: "GBP"),
  Account.new(accountNumber:8, accountName:"Restaurant", balance: 0, currency: "GBP"),
  Account.new(accountNumber:9, accountName:"Bookshop", balance: 0, currency: "GBP")]
accountList.each do |a|
  customer.accounts << a
  a.save
end
