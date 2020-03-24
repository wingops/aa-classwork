class User < ApplicationRecord
validates :username, presence: true, uniqueness: true
    
    has_many :artworks,
        class_name: :Artwork,
        foreign_key: :artist_id

    has_many :views,
        class_name: :ArtworkShare,
        foreign_key: :viewer_id

    has_many :shared_artworks,
        through: :views,
        source: :artwork
end