// on click assign the id of the card to the category param

$(document).ready(function() {
    console.log("ready")
    $('#category_form').submit(function(event) {
        event.preventDefault();
        let url = window.location.pathname;
        let pathArray = window.location.pathname.split('/');
        let id = pathArray[2]
        
        let value = $('#activity_category').val()
        value = parseInt(value)



        let activity = {
            "activity_id": id,
            "category": value
        }
        
                $.ajax({  
                    url: 'http://localhost:3000' + url,  
                    type: 'PUT',  
                    dataType: 'json',  
                    data: activity,  
                    success: function (data, textStatus, xhr) {  
                        console.log(data);  
                    },  
                    error: function (xhr, textStatus, errorThrown) {  
                        console.log('Error in Operation');  
                    }  
                });  
        
    });

});