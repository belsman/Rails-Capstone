class User < ApplicationRecord
    validates :username, :fullname, presence: true
    validates :username, length: { minimum: 3 }
    validates_uniqueness_of :username

    has_many :buzzs, foreign_key: 'author_id', class_name: 'Buzz'
    has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followed, class_name: 'Following', foreign_key: 'follower_id'

    def follow(user)
        followed.create(followed_id: user.id) unless is_following?(user)
    end

    def unfollow(user)
        f = followed.where(followed_id: user.id).first
        f.destroy unless f.nil?
    end

    def is_following?(user)
        return false if user.id.nil?
        !followed.where(followed_id: user.id).first.nil?
    end

    def is_followed_by?(user)
        return false if user.id.nil?
        !followers.where(follower_id: user.id).first.nil?
    end
end
