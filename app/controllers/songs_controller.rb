class SongsController < ApplicationController
    before_action :logged_out?

    def new
        @song = Song.new
        @song.artist = Artist.new
        @song.genre = Genre.new
    end

    def create
        if params[:user_id]
            @user = User.find(params[:user_id])
            @song = Song.find(params[:id])
            @user.songs << @song
            redirect_to user_songs_path(@user)
        elsif params[:playlist_id]
            @playlist = Playlist.find(params[:playlist_id])
            @song = Song.find(params[:id])
            @playlist.songs << @song
            redirect_to playlist_songs_path(@playlist)
        else
            @song = Song.new(song_params)
            if @song.save
                redirect_to song_path(@song)
            else
                render :new
            end
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])

        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def add_song_playlist
        @song = Song.find(params[:id])
        @user = current_user
    end

    def show
        if params[:user_id]
            @user = User.find(params[:user_id])
            @song = Song.find(params[:id])
            redirect_to song_path(@song) if !@user.songs.include?(@song)
        elsif params[:playlist_id]
            @playlist = Playlist.find(params[:playlist_id])
            @song = Song.find(params[:id])
            redirect_to song_path(@song) if !@playlist.songs.include?(@song)
        else
            @song = Song.find(params[:id])
        end
    end

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @songs = @user.songs
        elsif params[:playlist_id]
            @playlist = Playlist.find(params[:playlist_id])
            @songs = @playlist.songs
        else
            @songs = Song.all
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private
    def song_params
        params.require(:song).permit(:title, :artist_id, :genre_id, artist_attributes: [:name], genre_attributes: [:name])
    end
end