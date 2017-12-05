class UserAccountsController < InheritedResources::Base
  def new
    @user_account = UserAccount.new
  end
  def create
    @user_account = UserAccount.new user_account_params
    @user_account.user = current_user
    if @user_account.save
      redirect_to edit_user_account_path(@user_account)
    else
      redirect_to new_user_account_path
    end
  end
  def edit
    @user_account = UserAccount.find params[:id]    
  end
  def update
    @user_account = UserAccount.find params[:id]
    if @user_account.update user_account_params
      redirect_to user_dashboard_index_path
    else
      render :edit
    end
  end
  private

    def user_account_params
      params.require(:user_account).permit(:goal,:financial_goal, :account_id, 
                                                 :annual_income, 
                                                 :fin_assets, 
                                                 :non_fin_assets, 
                                                 :liabilities, :user_id, 
                                                 :withdrawals, 
                                                 :inc_stability, 
                                                 :time_horizon, :strategy_id,
                                                 :portfolio_id)
    end

end

