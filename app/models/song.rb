class Song < ApplicationRecord
    validates :name, presence: true
    belongs_to :artist, :genre, :playlist
    has_many :user_songs
    has_many :users, through: :user_songs
    accepts_attributes_for :artist


    def artist=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end
end