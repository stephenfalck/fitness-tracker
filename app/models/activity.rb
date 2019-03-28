class Activity < ApplicationRecord
    validates :category, presence: true, if: :active_or_category?
    validates :date, :duration, presence: true, if: :active_or_datetime?

    before_save :convert_category

    def active?
        status == 'active'
      end

      def active_or_category?
        status.include?('category') || active?
      end

      def active_or_datetime?
        status.include?('datetime') || active?
      end


    belongs_to :user
    belongs_to :category

    private 
    def convert_category 
        self[:category_id] = self[:category_id].to_i
    end
end
