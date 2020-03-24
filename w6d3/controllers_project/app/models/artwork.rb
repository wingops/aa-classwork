class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :artist_id}
    validates :image_url, presence: true 
    validates :artist_id, presence: true

    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id

    has_many :viewers,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id

    has_many :shared_viewers,
        through: :viewers,
        source: :viewer

end