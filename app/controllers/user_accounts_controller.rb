class UserAccountsController < InheritedResources::Base
  def new
    @user_account = UserAccount.new
  end
  def create
    @user_account = UserAccount.new user_account_params
    if @user_account.save
      redirect_to portfolios_path
    else
      redirect_to new_user_account_path
    end
  end
  private

    def user_account_params
      params.require(:user_account).permit(:goal,:financial_goal, :account_id, :annual_income, :fin_assets, :non_fin_assets, :liabilities)
    end
end

