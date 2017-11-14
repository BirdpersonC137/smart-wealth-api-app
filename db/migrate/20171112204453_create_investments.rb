class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.string :ticker
      t.string :name
      t.float :price
      t.float :yield
      t.float :mer
      t.string :risk_category
      t.string :objective
      t.string :distribution
      t.string :style
      t.string :typeof

      t.timestamps
    end
  end
end
