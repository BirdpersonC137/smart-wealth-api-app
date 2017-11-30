class Account < ApplicationRecord
  belongs_to :account_type
  has_many :user_accounts
end
