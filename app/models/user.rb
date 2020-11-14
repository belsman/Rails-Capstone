class User < ApplicationRecord
    validates :username, :fullname, presence: true
    validates :username, length: { minimum: 3 }
    validates_uniqueness_of :username
end
