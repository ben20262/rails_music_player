class UsersController < ApplicationController
    before_action :logged_out?, only: [:show, :songs]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
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

    def add_song
        @song = Song.find(params[:id])
        if !current_user.songs.include?(@song)
            current_user.songs << @song
        end
        redirect_to user_songs_path(current_user)
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end