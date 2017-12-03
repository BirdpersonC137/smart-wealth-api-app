class AddStrategyAndAbilityToAssumeRiskToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ability_to_assume_risk, :string
    add_column :users, :strategy, :string
    add_column :users, :IPQ, :decimal
  end
end
