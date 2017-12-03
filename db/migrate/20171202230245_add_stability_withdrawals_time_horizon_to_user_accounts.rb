class AddStabilityWithdrawalsTimeHorizonToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :inc_stability, :float
    add_column :user_accounts, :withdrawals, :float
    add_column :user_accounts, :time_horizon, :float
  end
end
