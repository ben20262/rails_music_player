class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    has_many :user_songs
    has_many :songs, through: :user_songs
    has_many :playlists

end