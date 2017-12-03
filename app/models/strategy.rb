class Strategy < ApplicationRecord
    has_many :portfolio_strategies, dependent: :destroy
    has_many :portfolios, through: :portfolio_strategies
end
