class AddInitialInvestmentToUserAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :init_investment, :float
  end
end
