class Transaction < ApplicationRecord
  belongs_to :sendingAccount, class_name: 'Account'
  belongs_to :recievingAccount, class_name: 'Account'
  validates :amount, presence: true,
  numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000}
  validates :currency, presence: true
  validates :transactionNumber, uniqueness: true, presence: true
end
