class PlaylistsController < ApplicationController
    before_action :logged_out?

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(name: params[:playlist][:name], user_id: current_user.id)

        if @playlist.save
            redirect_to playlist_path(@playlist)
        else
            render :new
        end
    end

    def update
        @playlist = Playlist.find(params[:id])
        @song = Song.find(params[:song_id])
        if !@playlist.songs.include?(@song)
            @playlist.songs << @song
        end
        redirect_to playlist_path(@playlist)
    end

    def show
        @playlist = Playlist.find(params[:id])
    end

    def index
        @user = current_user
    end

    def destroy
        Playlist.find(params[:id]).destroy
        redirect_to playlists_path
    end

end