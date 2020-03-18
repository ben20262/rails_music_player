class SessionsController < ApplicationController
    
    def new
        if logged_in?
            redirect_to root_path
        end
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])

        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        if logged_in?
            session.delete(:user_id)
        end
        redirect_to login_path
    end
end