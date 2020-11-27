class Customer < ApplicationRecord
  has_many :Account
  has_secure_password
  validates :customerNumber, presence: true
  validates :forename, presence: true
  validates :surname, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone, presence: true, format: { with: /\d{11}/}
  validates :dob, presence: true
  validates :password, presence: true, length: {minimum: 8, maximum: 12}
end
