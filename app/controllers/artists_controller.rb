class ArtistsController < ApplicationController
    before_action :logged_out?

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(name: params[:artist][:name])

        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])

        if @artist.update(name: params[:artist][:name])
            redirect_to artist_page(@artist)
        else
            render :edit
        end
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def index
        @artists = Artist.all
    end

    def destroy
        Artist.find(params[:id]).destroy
        redirect_to artists_path
    end

end