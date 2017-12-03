class UserAccount < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates_numericality_of :financial_goal, :annual_income, :fin_assets, :non_fin_assets, :liabilities
  validates(:financial_goal, numericality:{
    greater_than_or_equal_to: 0
})
  before_save :user_age_factor
  after_save :assign_risk_profile_to_user
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
    @ipq = [self.liabilities, self.fin_assets, self.non_fin_assets, self.annual_income, self.age_factor, self.time_horizon, self.withdrawals, self.inc_stability].sum
    if @ipq < 14
      @user.risk_profile = "Low Risk Tolerance"
      @user.inv_objective = 'Defensive'
      @user.strategy = 'POC'      
      @user.IPQ = @ipq
      @user.save
    elsif @ipq < 26
      @user.risk_profile = "Low to Medium"
      @user.inv_objective = 'Income' 
      @user.strategy = 'CG'     
      @user.IPQ = @ipq
      @user.save
    elsif @ipq < 38
      @user.risk_profile = "Medium"
      @user.inv_objective = 'Balanced Balanced'
      @user.strategy = 'Balanced Growth'
      @user.IPQ = @ipq
      @user.save
    elsif @ipq < 50
      @user.risk_profile = "Medium to High"
      @user.inv_objective = 'Growth'
      @user.strategy = 'Aggressive Growth'
      @user.IPQ = @ipq
      @user.save
    else
      @user.risk_profile = "High"
      @user.inv_objective = 'Growth'
      @user.strategy = 'Alpha'
      @user.IPQ = @ipq
      @user.save
    end
  end
end
