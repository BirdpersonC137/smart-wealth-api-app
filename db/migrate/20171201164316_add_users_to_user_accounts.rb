class AddUsersToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_accounts, :user, foreign_key: true
  end
end
