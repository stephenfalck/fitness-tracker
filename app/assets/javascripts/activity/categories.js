// on click assign the id of the card to the category param


$(document).ready(function() {
    console.log("ready")
    $('.categories').click(function(event) {
        //event.preventDefault();
        let url = window.location.pathname;
        let pathArray = window.location.pathname.split('/');
        let id = pathArray[2]

       
        let value = $(event.target).closest('.card').attr('id')
        value = parseInt(value)
        



        let activity = {
            "activity": {
                //  "activity_id": id,
                "category_id": value
                //"status": ""
            }
        }
        
                $.ajax({  
                    url: 'http://localhost:3000' + url,  
                    type: 'PUT',  
                    dataType: 'text', //'json',  
                    data: activity,  
                    success: function (data, textStatus, xhr) {  
                        console.log(data);  
                    },  
                    error: function (xhr, textStatus, errorThrown) {  
                        console.log('Error in Operation');  
                        console.log(textStatus)
                    }  
                });  
        
    });

});

