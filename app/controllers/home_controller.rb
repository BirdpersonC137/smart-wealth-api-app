class HomeController < ApplicationController
    def index
        @investments=Investment.all
        @users = User.all
    end
end
