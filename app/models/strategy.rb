class Strategy < ApplicationRecord
    has_many :portfolio_strategies, dependent: :destroy
    has_many :portfolios, through: :portfolio_strategies
    has_many :user_accounts
    delegate :user_account, to: :strategy   
    has_many :users, through: :user_accounts
    
end
