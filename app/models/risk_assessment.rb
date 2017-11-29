class RiskAssessment < ApplicationRecord
    has_many :survey_questions, dependent: :destroy
    accepts_nested_attributes_for :survey_answers, :reject_if => lambda {|a| a[:content].blank?}, allow_destroy: true
end
