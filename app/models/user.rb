class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password validations: false
    validates :password, presence: true, unless: :facebook_validated?
    

    has_many :user_songs
    has_many :songs, through: :user_songs
    has_many :playlists

    def facebook_validated?
        !!uid
    end

end