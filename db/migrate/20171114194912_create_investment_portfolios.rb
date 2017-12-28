class CreateInvestmentPortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :investment_portfolios do |t|
      t.references :investment, foreign_key: true
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
