class Transaction < ApplicationRecord
  belongs_to :sendingAccount, class_name: 'Account'
  belongs_to :recievingAccount, class_name: 'Account'
end
