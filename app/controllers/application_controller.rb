class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !!session[:user_id]
    end

    def logged_out?
        redirect_to login_path if !session[:user_id]
    end

    def current_user
        if logged_in?
            User.find(session[:user_id])
        end
    end
end
