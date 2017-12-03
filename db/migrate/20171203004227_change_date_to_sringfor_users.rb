class ChangeDateToSringforUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :date_of_birth, :string
  end
end
