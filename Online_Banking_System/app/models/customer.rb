class Customer < ApplicationRecord
  has_many :Account
  has_secure_password
end
