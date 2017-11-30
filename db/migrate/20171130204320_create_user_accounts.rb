class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.string :goal
      t.float :financial_goal
      t.references :account, foreign_key: true
      t.float :annual_income
      t.float :fin_assets
      t.float :non_fin_assets
      t.float :liabilities
      t.timestamps
    end
  end
end
