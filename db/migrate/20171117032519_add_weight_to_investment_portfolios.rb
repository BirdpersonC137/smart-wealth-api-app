class AddWeightToInvestmentPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :investment_portfolios, :weight, :float
  end
end
