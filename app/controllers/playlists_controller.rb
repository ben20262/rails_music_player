class PlaylistsController < ApplicationController
    before_action :logged_in?

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
    end

    def edit
        @playlist = Playlist.find(params[:id])
    end

    def update
        @playlist = Playlist.find(params[:id])

        if @playlist.update(playlist_params)
            redirect_to playlist_path(@playlist)
        else
            render :edit
        end
    end

    def show
        @playlist = Playlist.find(params[:id])
    end

    def index
        @playlist = current_user.playlists
    end

    def destroy
        Playlist.delete(params[:id])
        redirect_to playlists_path
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name)
    end

end