class Song < ApplicationRecord
    validates :title, presence: true

    belongs_to :artist
    belongs_to :genre

    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs

    has_many :user_songs
    has_many :users, through: :user_songs
    
    accepts_nested_attributes_for :artist, :genre


    def artist_attributes=(artist_name)
        self.artist = Artist.find_or_create_by(artist_name) if !artist_name[:name].empty?
    end

    def genre_attributes=(genre_name)
        self.genre = Genre.find_or_create_by(genre_name) if !genre_name[:name].empty?
    end

end