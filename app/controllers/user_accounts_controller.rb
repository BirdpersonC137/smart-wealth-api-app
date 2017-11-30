class UserAccountsController < InheritedResources::Base

  private

    def user_account_params
      params.require(:user_account).permit(:goal,:financial_goal, :account_id, :annual_income, :fin_assets, :non_fin_assets, :liabilities)
    end
end

