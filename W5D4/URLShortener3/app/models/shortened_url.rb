class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true
    validates :submitter_id, :long_url, presence: true

    has_many :visits,
        foreign_key: :visited_short_url,
        class_name: :Visit
    
    belongs_to :submitter, 
        foreign_key: :submitter_id,
        class_name: :User

    has_many :visitors,
        through: :visits,
        source: :user

    def self.random_code
        loop do
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code unless ShortenedUrl.exists?(short_url: random_code)
        end
    end

    def self.create_for_user_and_url(user, long_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end

    def num_clicks
        # data = Visit.all
        # count = 0
        # data.each do |datum|
        #     count += 1 if self.id == datum.visited_short_url
        # end
        # count
        data = 
        SELECT

    end

    def num_uniques
        data = Visit.all
        visit_count = Hash.new {|h,k| h[k] = 0}
        data.each {|datum| visit_count[datum.visiting_user_id] += 1 if datum.visited_short_url == self.id}
        visit_count.keys.length
    end

    def num_recent_uniques
    end

end
