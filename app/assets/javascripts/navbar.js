document.addEventListener("turbolinks:load", function() {

    if (($('body').data('controller') === 'pages' && $('body').data('action') === 'index')) {
        $("#nav-home-link").addClass("active");
    } else if (($('body').data('controller') === 'activities' && $('body').data('action') === 'index')) {
        $("#nav-activities-link").addClass("active");
    } else if (($('body').data('controller') === 'registrations' && $('body').data('action') === 'edit')) {
        $("#user-settings").addClass("active");        
    } else if (($('body').data('controller') === 'sessions' && $('body').data('action') === 'new')) {
        $("#nav-login-link").addClass("active");
    } else if (($('body').data('controller') === 'registrations' && $('body').data('action') === 'new')) {
        $("#nav-signup-link").addClass("active");
    }

});