class User < ApplicationRecord
    validates :username, :fullname, presence: true
    validates :username, length: { minimum: 3 }
    validates_uniqueness_of :username

    has_many :buzzs, foreign_key: 'author_id', class_name: 'Buzz'
    has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followed, class_name: 'Following', foreign_key: 'follower_id'
end
