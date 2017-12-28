class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.float :cad_equity
      t.float :us_equity
      t.float :int_equity
      t.float :emerging_equity
      t.float :alternatives
      t.float :cad_fixed_income
      t.float :int_fixed_income
      t.float :cash
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
