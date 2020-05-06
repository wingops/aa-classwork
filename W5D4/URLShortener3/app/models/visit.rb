class Visit < ApplicationRecord

    validates :visiting_user_id, :visited_short_url, presence: true

    def self.record_visit!(user, shortened_url)
        Visit.create!(visiting_user_id: user.id, visited_short_url: shortened_url.short_url)
    end
    
    belongs_to :user,
        foreign_key: :visiting_user_id,
        class_name: :User
        
    belongs_to :url,
        foreign_key: :visited_short_url,
        class_name: :ShortenedUrl

    def self.record_visit!(user, shortened_url)
        Visit.create(
            user.id, shortened_url.id
        )
    end 


end
