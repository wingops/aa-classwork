class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        debugger
        @user = User.new(user_params)
        if @user.save
            session[:session_token] = user.reset_session_token!
            render @user
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
