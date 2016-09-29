$(document).ready(function() {
    function generate(){
        // console.log("hello");
        
        var arival_arr = [];
        var service_arr = [];
        while(true){
            // console.log("loop for arival_arr");
            var tmp_num = (Math.random())*6;
            arival_arr.push(Math.round(tmp_num*100)/100);
            if(arival_arr.reduce(add, 0) > 20){
                break;
            }
        }
        
        while(true){
            // console.log("loop for service_arr");
            service_arr.push(Math.round((Math.random())*5.5*100)/100);
            if(service_arr.reduce(add, 0) > 20){
                break;
            }
        }
        
        var arival_str = arival_arr.join()
        var service_str = service_arr.join()
        document.getElementById('schedule_name').value = "random generated"
        document.getElementById('arrival_str').value = arival_str
        document.getElementById('service_str').value = service_str
        
    }
    
    function add(a, b) {
        return a + b;
    }
    
    $("#generate").click(generate);
});