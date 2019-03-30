class Activity < ApplicationRecord
    validates :duration, presence: true
    #validates :date, presence: true
    validates :category_id, presence: true

    before_save :convert_category

    belongs_to :user
    belongs_to :category

    private 
    def convert_category 
        self[:category_id] = self[:category_id].to_i
    end
end
