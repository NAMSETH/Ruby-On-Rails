class Customer < ApplicationRecord
  has_many :Account
  has_secure_password
  validates :customerNumber, presence: true
  validates :forename, presence: true
  validates :surname, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone, presence: true, format: { with: /\d{5} \d{6}/}
  validates :dob, presence: true
end
