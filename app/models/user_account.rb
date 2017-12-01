class UserAccount < ApplicationRecord
  belongs_to :account
  belongs_to :user
  private
  def assign_risk_profile_to_user
    # if self.financial_goal
  end
end
