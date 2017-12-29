class AddStrategyToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_reference :portfolios, :strategy, foreign_key: true
  end
end
