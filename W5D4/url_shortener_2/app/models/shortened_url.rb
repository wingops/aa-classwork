# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  short_url    :string
#  long_url     :string
#  submitter_id :integer
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true
    validates :submitter_id, :long_url, presence: true

    belongs_to :submitter, 
        foreign_key: :submitter_id,
        class_name: :User

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
end
