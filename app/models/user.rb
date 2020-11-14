class User < ApplicationRecord
    validates :username, :fullname, presence: true
    validates :username, length: { minimum: 3 }
    validates_uniqueness_of :username

    has_many :buzzs, foreign_key: 'author_id', class_name: 'Buzz'
end
