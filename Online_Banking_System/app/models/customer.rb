class Customer < ApplicationRecord
  has_many :Account
  has_secure_password
  validates :customerNumber, presence: true, length: {minimum: 8, maximum: 16}, uniqueness: true
  validates :password, presence:true, length: {minimum: 8}
  validates :email, presence:true, format: {with: URI::MailTo::EMAIL_REGEXP}
end
