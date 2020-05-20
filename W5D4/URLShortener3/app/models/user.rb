# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    
    has_many :shortened_urls,
        foreign_key: :submitter_id,
        class_name: :ShortenedUrl

    has_many :visits,
        foreign_key: :visiting_user_id,
        class_name: :Visit

    has_many :visited_urls,
        through: :visits,
        source: :url
    
end
