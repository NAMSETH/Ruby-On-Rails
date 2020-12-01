class Account < ApplicationRecord
  belongs_to :customer
  validates :accountName, presence: true
  validates :accountNumber, presence: true, uniqueness: true
  validates :balance, presence: true,
  numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000}
  validates :currency, presence: true
end
