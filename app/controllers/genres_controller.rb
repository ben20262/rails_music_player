class GenresController < ApplicationController
    before_action :logged_out?
    
    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])
        if @genre.save
            redirect_to genre_path(@genre)
        else
            render :new
        end
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def index
        @genres = Genre.all
    end

    def destroy
        Genre.find(params[:id]).destroy
        redirect_to genres_path
    end

end