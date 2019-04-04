module FooterHelper
    def footer_links
        if user_signed_in?
            'layouts/footer/signed_in_links'
        else
            'layouts/footer/non_signed_in_links'
        end
    end
end