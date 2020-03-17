module ApplicationHelper

    def logged_in?
        redirect_to new_session_path if !user_signed_in?
    end
end
