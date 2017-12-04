class AddStrategyToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_accounts, :strategy, foreign_key: true
  end
end
