class User < ApplicationRecord
    validates :username, :fullname, presence: true
    validates :username, length: { minimum: 3 }
    validates_uniqueness_of :username

    has_many :buzzs, foreign_key: 'author_id', class_name: 'Buzz'
    has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followed, class_name: 'Following', foreign_key: 'follower_id'

    def follow(user)
        followed.create(followed_id: user.id) unless following?(user)
    end

    def unfollow(user)
        f = followed.where(followed_id: user.id).first
        f.destroy unless f.nil?
    end

    def following?(user)
        return false if user.id.nil?
        !followed.where(followed_id: user.id).first.nil?
    end

    def followed_by?(user)
        return false if user.id.nil?
        !followers.where(follower_id: user.id).first.nil?
    end

    def buzz_count
        buzzs.count
    end

    def followed_count
        followed.count - 1
    end

    def followers_count
        followers.count - 1
    end

    def timeline_buzzs
        query_string = "INNER JOIN followings ON followings.followed_id = buzzs.author_id AND followings.follower_id = #{id}"
        Buzz.joins(query_string).ordered_by_most_recent
    end

    after_create do
        follow(self)
    end
end
