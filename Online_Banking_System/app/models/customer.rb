class Customer < ApplicationRecord
  has_many :accounts
  has_secure_password

  validates :customerNumber, presence: true,  uniqueness: true
  validates :forename, presence: true, length: {minimum: 2}
  validates :surname, presence: true, length: {minimum: 2}
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness:true
  validates :phone, presence: true, format: { with: /\d{11}/}
  validates :dob, presence: true
  validates :password, presence: true, length: {minimum: 8, maximum: 12}

  def Customer.digest(passphrase)
  #From https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(passphrase, cost: cost)
  end

end
