class AddAgeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    remove_column :users, :sex
  end
end
