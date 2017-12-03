class CreatePortfolioStrategies < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_strategies do |t|
      t.references :portfolio, foreign_key: true
      t.references :strategy, foreign_key: true

      t.timestamps
    end
  end
end
