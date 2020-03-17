class UsersController < ApplicationController
    before_action :logged_in?, only: [:show, :songs]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_page(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def songs
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end