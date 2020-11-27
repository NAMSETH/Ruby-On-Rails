class Customer < ApplicationRecord
  has_many :Account
  has_secure_password
  validates :forename, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :dob, presence: true
end
