document.addEventListener("turbolinks:load", function() {

    

    if (!($('body').data('controller') === 'activities' && $('body').data('action') === 'new')) {
        return ;
    }
      
    /*  STOPWATCH FUNCTIONALITY  */

    
    let timeElapsed = 0;

    function Stopwatch(e) {
        let time = 0;
        let interval;
        let offset;
        let startTime;
        let stopTime;
        
        
        function update() {
            if (this.isOn) {
                time += delta();
            }
            let formattedTime = timeFormatter(time);
            e.textContent = formattedTime;
        }

        function delta() {
            let now = Date.now();
            let timePassed =  now - offset;
            offset = now;
            return timePassed;
        }

        function timeFormatter(timeInMilliseconds) {
            let time = new Date(timeInMilliseconds)
            let hours = time.getHours().toString();
            let minutes = time.getMinutes().toString();
            let seconds = time.getSeconds().toString();
            let milliseconds = time.getMilliseconds().toString();

            if (hours.length < 2 ) {
                hours = "0" + hours;
            }
            
            if (minutes.length < 2 ) {
                minutes = "0" + minutes;
            }

            if (seconds.length < 2 ) {
                seconds = "0" + seconds;
            }

            while (milliseconds.length < 3) {
                milliseconds = "0" + milliseconds;
            }
            return /*hours + ' : ' +*/ minutes + " : " + seconds  /* + " : " + milliseconds */
        }

        this.isOn = false;

        this.start = function() {
            if (!this.isOn) {
                startTime = Date.now();
                interval = setInterval(update.bind(this), 10);
                offset = Date.now();
                this.isOn = true;
            }
        };

        this.stop = function() {
            if (this.isOn) {
                stopTime = Date.now();
                clearInterval(interval)
                interval = null;
                this.isOn = false;
                timeElapsed += (stopTime - startTime);
                timeElapsed = Math.floor(timeElapsed /60000)
                //console.log(timeElapsed);
            }
        }

        this.reset = function() {
            if (!this.isOn) {
            time = 0;
            timeElapsed = 0;
            update();
            }
        }

    }

    /*  STOPWATCH DISPLAY  */
    
    let toggle = document.getElementById("toggle");
    let reset = document.getElementById("reset");
    let timer = document.getElementById("timer");

    let watch = new Stopwatch(timer);

    toggle.addEventListener('click', function() {
        if (watch.isOn) {
            watch.stop();
            toggle.textContent = "Start"
        } else {
            watch.start();
            toggle.textContent = "Stop"
        }
    });

    reset.addEventListener('click', function() {
        watch.reset();
    });

    /* AJAX TO SUBMIT THE DATE AND DURATION TO SERVER */

    let save = document.getElementById("save")

    save.addEventListener('click', function() {
        let url = window.location.pathname;
        let pathArray = window.location.pathname.split('/');
        let id = pathArray[3]

        Turbolinks.clearCache();

        const date = new Date();
        const mm = String(date.getMonth() + 1).padStart(2, '0');
        const dd = String(date.getDate()).padStart(2, '0');
        const formattedDate = `${date.getFullYear()}-${mm}-${dd}`
        console.log(formattedDate)

        const data = {
            "activity": {
                "category_id": id,
                "date": formattedDate,
                "duration": timeElapsed
            }
        }

        $.ajax({  
            url: 'http://localhost:3000/activities',  
            type: 'POST',  
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $("meta[name=csrf-token").attr('content'))
            },
            dataType: 'text', //'json',
            data: data,  
            success: function (data, textStatus, xhr) {  
                //console.log(data);  
            },  
            error: function (xhr, textStatus, errorThrown) {  
                console.log('Error in Operation');  
                console.log(textStatus)
            }  
        });  
    })

//})
  
});