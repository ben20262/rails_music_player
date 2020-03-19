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

    def face_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
    
        session[:user_id] = @user.id
    
        redirect_to root_path
    end

    def destroy
        if logged_in?
            session.delete(:user_id)
        end
        redirect_to login_path
    end

    private
 
    def auth
        request.env['omniauth.auth']
    end
    
end