class AccountsController < InheritedResources::Base
  def new
    @account = Account.new
  end
  def create
    @account = Account.new account_params
    if @account.save
      redirect_to new_account_path
      flash[:notice] = "Account created"
    else
      render :new
    end
  end
  private

    def account_params
      params.require(:account).permit(:name, :account_type_id)
    end
end

