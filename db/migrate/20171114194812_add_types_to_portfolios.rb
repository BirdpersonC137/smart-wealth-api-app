class AddTypesToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :cad_equity, :float
    add_column :portfolios, :us_equity, :float
    add_column :portfolios, :int_equity, :float
    add_column :portfolios, :emerging_equity, :float
    add_column :portfolios, :alternatives, :float
    add_column :portfolios, :cad_fixed_income, :float
    add_column :portfolios, :int_fixed_income, :float
  end
end
