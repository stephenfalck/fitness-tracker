class Activity < ApplicationRecord
    #validates :category, presence: true, if: -> {required_for_step?(:category)}
    #validates :date, :duration, presence: true, if: -> {required_for_step?(:datetime)}

    attr_accessor :form_step

    cattr_accessor :form_steps do 
        %w(category datetime)
    end

    def required_for_step?(step)

        return true if form_step.nil?

        return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
    end

    belongs_to :user
    belongs_to :category
end
