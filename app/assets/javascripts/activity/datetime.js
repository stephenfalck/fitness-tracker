$(document).ready(function() {

    /*  STOPWATCH FUNCTIONALITY  */

    function Stopwatch(e) {
        let time = 0;
        let interval;
        let offset;
        let startTime;
        let stopTime;
        let timeElapsed;
        
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
            total = timePassed
            offset = now;
            return timePassed;
        }

        function timeFormatter(timeInMilliseconds) {
            let time = new Date(timeInMilliseconds)
            //let hours = time.getHours().toString();
            let minutes = time.getMinutes().toString();
            let seconds = time.getSeconds().toString();

            /*if (hours.length < 2 ) {
                hours = "0" + hours;
            }*/
            
            if (minutes.length < 2 ) {
                minutes = "0" + minutes;
            }

            if (seconds.length < 2 ) {
                seconds = "0" + seconds;
            }
            return /*hours + ' : ' +*/ minutes + " : " + seconds
        }

        this.isOn = false;

        this.start = function() {
            if (!this.isOn) {
                startTime = Date.now();
                interval = setInterval(update.bind(this), 1000);
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
                timeElapsed = stopTime - startTime;
                console.log(timeElapsed)
            }
        }

        this.reset = function() {
            if (!this.isOn) {
            time = 0;
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

   
});