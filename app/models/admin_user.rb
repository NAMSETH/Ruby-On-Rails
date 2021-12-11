class AdminUser < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :password, presence: true, length: {minimum: 8, maximum: 12}

  def AdminUser.digest(passphrase)
  #From https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(passphrase, cost: cost)
  end
end
