class UserDashboardController < ApplicationController
    def index
        @user = current_user
        @user_accounts = UserAccount.where(user_id: @user.id)
        @user_account = UserAccount.find_by_user_id (@user.id)
    end
    def deposits
        @user = current_user
        @user_accounts = UserAccount.where(user_id: @user.id)
        @user_account = UserAccount.find_by_user_id (@user.id)              
    end
end
