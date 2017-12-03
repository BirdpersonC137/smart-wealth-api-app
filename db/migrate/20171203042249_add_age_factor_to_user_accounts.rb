class AddAgeFactorToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :age_factor, :float
  end
end
