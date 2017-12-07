class UserAccount < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :strategy, optional: true
  belongs_to :portfolio, optional: true
  validates_numericality_of :financial_goal, :annual_income, :fin_assets, :non_fin_assets, :liabilities
  validates(:financial_goal, numericality:{
    greater_than_or_equal_to: 0
})
  before_save :user_age_factor, :set_default_init_investment
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
  def set_default_init_investment
    self.init_investment ||= 0
  end
  def assign_risk_profile_to_user
      @user = self.user
      @ipq = [self.liabilities, 
              self.fin_assets, 
              self.non_fin_assets, 
              self.annual_income, 
              self.age_factor, 
              self.time_horizon, 
              self.withdrawals, 
              self.inc_stability].sum
    if @ipq > 0 && @ipq <= 14
        @user.risk_profile = "Low Risk Tolerance"
        @user.inv_objective = 'Defensive'
        @user.IPQ = @ipq
        self.update_column(:strategy_id, Strategy.where(name: 'Preservation of Capital').first.id)
        @user.save
    elsif @ipq > 14 && @ipq <=26
        @user.risk_profile = "Low to Medium"
        @user.inv_objective = 'Income' 
        @user.IPQ = @ipq
        self.update_column(:strategy_id, Strategy.where(name: 'Conservative Growth').first.id)      
        @user.save
    elsif @ipq > 26 && @ipq <= 38
        @user.risk_profile = "Medium"
        @user.inv_objective = 'Balanced'
        @user.IPQ = @ipq
        self.update_column(:strategy_id, Strategy.where(name: 'Growth').first.id)            
        @user.save
    elsif @ipq > 38 && @ipq <= 50
        @user.risk_profile = "Medium to High"
        @user.inv_objective = 'Growth'
        @user.IPQ = @ipq
        self.update_column(:strategy_id, Strategy.where(name: 'Aggressive Growth').first.id)                  
        @user.save
    else
        @user.risk_profile = "High"
        @user.inv_objective = 'Growth'
        @user.IPQ = @ipq
        self.update_column(:strategy_id, Strategy.where(name: 'Alpha').first.id)                  
        @user.save
    end
  end
end
