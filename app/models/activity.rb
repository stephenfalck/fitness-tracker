class Activity < ApplicationRecord
    validates :duration, presence: true
    validates :date, presence: true

    belongs_to :user
end
