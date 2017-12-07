class UserDashboardController < ApplicationController
    def index
        @user = current_user
        @user_accounts = UserAccount.where(user_id: @user.id)
        @user_account = UserAccount.where(user_id: @user.id).first       
    end
end
