class Strategy < ApplicationRecord
    has_many :portfolios
    has_many :user_accounts
    delegate :user_account, to: :strategy   
    has_many :users, through: :user_accounts
end
