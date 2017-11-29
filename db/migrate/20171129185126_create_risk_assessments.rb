class CreateRiskAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :risk_assessments do |t|
      t.string :title
      t.timestamps
    end
  end
end
