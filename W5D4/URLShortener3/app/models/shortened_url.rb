# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  short_url    :string
#  long_url     :string
#  submitter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

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
        visits.count

        # data = visits.where('visited_short_url = ?', self.id)
        # p data.count
    end

    def num_uniques

        visits.select(:visiting_user_id).distinct.count


        # data = Visit.all
        # visit_count = Hash.new {|h,k| h[k] = 0}
        # data.each {|datum| visit_count[datum.visiting_user_id] += 1 if datum.visited_short_url == self.id}
        # visit_count.keys.length
    end

    def num_recent_uniques
        visits.select(:visiting_user_id).where('created_at > ?',3.hours.ago).distinct.count
    end

end
