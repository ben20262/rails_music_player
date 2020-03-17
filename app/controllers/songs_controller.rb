class SongsController < ApplicationController
    before_action :logged_in?

    def new
        @song = Song.new
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

    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end

    def destroy
        Song.delete(params[:id])
        redirect_to songs_path
    end

    private
    def song_params
        params.require(:song).permit(:title, :artist_id, :genre_id)
    end
end