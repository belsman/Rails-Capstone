class Buzz < ApplicationRecord
    belongs_to :author, class_name: 'User'

    validates :text, presence: true, length: { maximum: 250, 
                                                too_long: '1000 characters in post is the maximum allowed.' }

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }

end
