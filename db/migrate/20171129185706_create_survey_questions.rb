class CreateSurveyQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_questions do |t|
      t.string :title
      t.references :risk_assessment, foreign_key: true
      t.integer :type
      t.timestamps
    end
  end
end
