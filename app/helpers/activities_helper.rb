module ActivitiesHelper

    def exercise_name(activity)
        #@categories zero indexed so either add one to the id or loop through categpries
        id = activity.category_id

        for category in @categories  do
            if id == category.id
                return category.name
            end
        end
    end

    def formatted_date(activity)
        date = activity.date.to_s.split("-")
        formatted = date[2] + "-" + date[1] + "-" + date[0]
        return formatted
    end
    

    def activity_card_class(activity)
        case activity.category_id
        when 1
            "running-card"
        when 2
            "walking-card"
        when 3
            "cycling-card"
        when 4
            "swimming-card"
        when 5
            "elliptical-card"
        when 6
            "rowing-card"
        when 7
            "circuit-card"
        when 8
            "hiit-card"
        when 9
            "weight-card"
        when 10
            "core-card"
        end
    end
end
