module PagesHelper
    def home_page_links_path
        if user_signed_in?
            'pages/call_to_action_links/signed_in_links'
        else
            'pages/call_to_action_links/non_signed_in_links'
        end
    end

    def first_name
        name = current_user.name.split(" ")
        return name[0]
    end

    def random_quote
        quotes = [
            "Fitness is not about being better than someone else... It's about being better than you used to be.",
            "In fitness, there are no short cuts. It involves immense discipline and hard work.",
            "Fitness is not just about hitting the gym; it is also about an inner happiness and an overall well-being.",
            "Time and health are two precious assets that we don't recognize and appreciate until they have been depleted.",
            "Physical fitness is not only one of the most important keys to a healthy body, it is the basis of dynamic and creative intellectual activity.",
            "To enjoy the glow of good health, you must exercise.",
            "True enjoyment comes from activity of the mind and exercise of the body; the two are ever united.",
            "You can always improve your fitness if you keep training.",
            "The human body is the best picture of the human soul.",
            "Fitness has nothing to do with age.",
            "Exercise should be regarded as a tribute to the heart."
        ]

        return quotes[rand(11)]
    end
end
