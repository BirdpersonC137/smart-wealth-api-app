class UserAccount < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates_numericality_of :financial_goal, :annual_income, :fin_assets, :non_fin_assets, :liabilities
  validates(:financial_goal, numericality:{
    greater_than_or_equal_to: 0
})
  after_save :assign_risk_profile_to_user
  before_save :user_age_factor
  private
  def user_age_factor
    @user = self.user
    if @user.age < 35
      self.age_factor = 8
    elsif @user.age < 49
      self.age_factor = 6
    elsif @user.age < 59
      self.age_factor = 4
    elsif @user.age < 69
      self.age_factor = 2
    else 
      self.age_factor = 0
    end
  end
  def assign_risk_profile_to_user
    @user = self.user    
    if [self.liabilities, self.fin_assets, self.non_fin_assets, self.annual_income].sum < 15
      @user.risk_profile = "test"
      @user.save
    elsif self.financial_goal < 5000
      @user.risk_profile = "Low Risk Tolerance"
      @user.save
    elsif self.financial_goal == 5000
      @user.risk_profile = "Medium Risk Tolerance"
      @user.save
    end
  end
end
