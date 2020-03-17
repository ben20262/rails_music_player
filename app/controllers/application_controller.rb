class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        if session[:user_id]
            if !User.find(session[:user_id])
                session.delete(:user_id)
                redirect_to new_session_path
            end
        else
            redirect_to new_session_path
        end
    end

    def current_user
        if logged_in?
            User.find(session[:user_id])
        end
    end
end
