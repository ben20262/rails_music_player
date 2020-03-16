class Song < ApplicationRecord
    validates :name, presence: true
    belongs_to :user, :artist, :genre, :playlist
    accepts_attributes_for :artist


    def artist=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end
end