class Buzz < ApplicationRecord
    belongs_to :author, class_name: 'User'
    validates :text, presence: true
end
