class Account < ApplicationRecord
  belongs_to :customer
  validates :accountName, presence: true
  validates :accountNumber, presence: true, uniqueness: true
  validates :balance, presence: true
  validates :currency, presence: true
end
