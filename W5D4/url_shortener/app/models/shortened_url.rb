class ShortenedURL < ApplicationRecord
    #  id           :bigint     not null, primary key
    # short_url   string    
    # long_url    string
    # user_id     integer

    validates :short_url, uniqueness: true, index: true
    validates :user_id, index: true

    def self.random_code(user, long_url)
        short_url = ''
        while short_url == '' || short_url.exists?
            short_url = SecureRandom.urlsafe_base64(long_url)
        end
        ShortenedURL.create({"user_id" =>user.id, "short_url" => short_url, "long_url" => long_url})
    end

    belongs_to :submitter,
        foreign_key: :user_id,
        class_name: :User
end