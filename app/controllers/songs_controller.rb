class SongsController < ApplicationController
    before_action :logged_out?

    def new
        @song = Song.new
        @song.artist = Artist.new
        @song.genre = Genre.new
    end

    def create
        @song = Song.new(song_params)

        if @song.save
            redirect_to song_path(@song)
        else
            render :new
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
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
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