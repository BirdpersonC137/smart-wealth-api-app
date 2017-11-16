class AddCashToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :cash, :float
  end
end
