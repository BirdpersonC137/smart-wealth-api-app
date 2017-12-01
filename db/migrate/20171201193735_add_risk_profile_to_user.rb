class AddRiskProfileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :risk_profile, :string
  end
end
