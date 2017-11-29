class RiskAssessmentsController < ApplicationController
    def create
    end
    def new
        @risk_assessment = RiskAssessment.new
        3.times do
            survey_question = @risk_assessment.survey_questions.build
            4.times{survey_question.survey_answers.build}
        end
    end
    def update
    end
    def edit
        
    end
end
