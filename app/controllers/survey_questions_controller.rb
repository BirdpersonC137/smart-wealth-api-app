class SurveyQuestionsController < ApplicationController
    has_many :survey_answers, dependent: :destroy

end
