class Transaction < ApplicationRecord
  validates :transactionDate , presence: true
  validates :recievingAccount , presence: true
  validates :currency , presence: true
end
