$(document).ready(function() {
    var canvas_q_t = document.getElementById('q_t_graph');
    var context_q_t = canvas_q_t.getContext('2d');
    var canvas_b_t = document.getElementById('b_t_graph');
    var context_b_t = canvas_b_t.getContext('2d');
    
    var maxX = 20
    var max_qY = 6
    var max_bY = 2
    var numbered_interval_x = 5
    var numbered_interval_y = 1
    
    var scale_line_size = 10
    var font_size = 10
    
    // resize the canvas to fill browser window dynamically
    window.addEventListener('resize', resizeCanvas, false);
    
    function resizeCanvas() {
        canvas_q_t.width = document.getElementById("q_t_graph").offsetWidth;
        canvas_q_t.height = document.getElementById("q_t_graph").offsetHeight;
        canvas_b_t.width = document.getElementById("b_t_graph").offsetWidth;
        canvas_b_t.height = document.getElementById("b_t_graph").offsetHeight;

        /**
         * Your drawings need to be inside this function otherwise they will be reset when 
         * you resize the browser window and the canvas goes will be cleared.
         */
        drawStuff_q_t(); 
        drawStuff_b_t(); 
        
    }
    resizeCanvas();
    
    function drawStuff_q_t() {
        // do your drawing stuff here
        var context = canvas_q_t.getContext('2d');

        context.beginPath();
        context.font=String(font_size)+"px Arial";
        
        /*x, y 기준선 그림*/
        context.moveTo(scale_line_size, 0);
        context.lineTo(scale_line_size, canvas_q_t.height-scale_line_size);
        context.lineTo(canvas_q_t.width, canvas_q_t.height-scale_line_size);
        
        /*눈금 그림*/
        var numbered_interval_x_size = Number(((canvas_q_t.width-scale_line_size)/(maxX/numbered_interval_x)).toFixed(0));
        var numbered_interval_y_size = Number(((canvas_q_t.height-scale_line_size)/(max_qY/numbered_interval_y)).toFixed(0));
        
        /*x축 눈금 그리기*/
        var current_x = scale_line_size;
        var current_y = canvas_q_t.height-scale_line_size;
        context.moveTo(current_x, current_y);
        
        for(var i=0; i< (Number((maxX/numbered_interval_x).toFixed(0))) + 1; i++){
            context.moveTo(current_x, current_y+scale_line_size);
            context.lineTo(current_x, current_y);
            if(i==0){
                context.fillText(i*numbered_interval_x, current_x-font_size, current_y+font_size);
            }else{
                context.fillText(i*numbered_interval_x, current_x-2*font_size, current_y+font_size);
            }
            
            current_x += numbered_interval_x_size;
        }
        
        
        /*y축 눈금 그리기*/
        var current_x = scale_line_size;
        var current_y = canvas_q_t.height-scale_line_size;
        context.moveTo(current_x, current_y);
        
        for(var i=0; i<(Number((max_qY/numbered_interval_y).toFixed(0))) + 1; i++ ){
            context.moveTo(current_x, current_y);
            context.lineTo(0, current_y);
            if(i>0){
                context.fillText(i*numbered_interval_y, 0, current_y+font_size)
            }
            
            current_y -= numbered_interval_y_size;
        }
        
        /*그래프 그리기*/
        var q_t_data_list_str = document.getElementById("q_t_graph_data").getAttribute('data');
        var q_t_data_list = str_to_2d_arr(q_t_data_list_str)
        
        context.moveTo(scale_line_size, canvas_q_t.height-scale_line_size)
        for(var i=0; i<q_t_data_list.length; i++){
            context.lineTo((canvas_q_t.width-scale_line_size)/(maxX/q_t_data_list[i][0])+scale_line_size, (canvas_q_t.height-scale_line_size)-(canvas_q_t.height-scale_line_size)/(max_qY/q_t_data_list[i][1]))
        }
        
        context.stroke();
    }
    
    // string 형식으로 된 배열을 js 2차원 배열으로 변환
    function drawStuff_b_t() {
        // do your drawing stuff here
        var context = canvas_b_t.getContext('2d');

        context.beginPath();
        context.font=String(font_size)+"px Arial";
        
        /*x, y 기준선 그림*/
        context.moveTo(scale_line_size, 0);
        context.lineTo(scale_line_size, canvas_b_t.height-scale_line_size);
        context.lineTo(canvas_b_t.width, canvas_b_t.height-scale_line_size);
        
        /*눈금 그림*/
        var numbered_interval_x_size = Number(((canvas_b_t.width-scale_line_size)/(maxX/numbered_interval_x)).toFixed(0));
        var numbered_interval_y_size = Number(((canvas_b_t.height-scale_line_size)/(max_bY/numbered_interval_y)).toFixed(0));
        
        /*x축 눈금 그리기*/
        var current_x = scale_line_size;
        var current_y = canvas_b_t.height-scale_line_size;
        context.moveTo(current_x, current_y);
        
        for(var i=0; i< (Number((maxX/numbered_interval_x).toFixed(0))) + 1; i++){
            context.moveTo(current_x, current_y+scale_line_size);
            context.lineTo(current_x, current_y);
            if(i==0){
                context.fillText(i*numbered_interval_x, current_x-font_size, current_y+font_size);
            }else{
                context.fillText(i*numbered_interval_x, current_x-2*font_size, current_y+font_size);
            }
            
            current_x += numbered_interval_x_size;
        }
        
        
        /*y축 눈금 그리기*/
        var current_x = scale_line_size;
        var current_y = canvas_b_t.height-scale_line_size;
        context.moveTo(current_x, current_y);
        
        for(var i=0; i<(Number((max_bY/numbered_interval_y).toFixed(0))) + 1; i++ ){
            context.moveTo(current_x, current_y);
            context.lineTo(0, current_y);
            if(i>0){
                context.fillText(i*numbered_interval_y, 0, current_y+font_size)
            }
            
            current_y -= numbered_interval_y_size;
        }
        
        /*그래프 그리기*/
        var b_t_data_list_str = document.getElementById("b_t_graph_data").getAttribute('data');
        var b_t_data_list = str_to_2d_arr(b_t_data_list_str)
        
        context.moveTo(scale_line_size, canvas_b_t.height-scale_line_size)
        for(var i=0; i<b_t_data_list.length; i++){
            context.lineTo((canvas_b_t.width-scale_line_size)/(maxX/b_t_data_list[i][0])+scale_line_size, (canvas_b_t.height-scale_line_size)-(canvas_b_t.height-scale_line_size)/(max_bY/b_t_data_list[i][1]))
        }
        
        context.stroke();
    }
    
    function str_to_2d_arr(raw_2d_array_str){
        var c = raw_2d_array_str.substring(1, raw_2d_array_str.length-1).split("]");
        var list = []
        for(var i=0; i<c.length-1; i++){
            var point = c[i].split(",")
            
            if(i===0){
                var new_point = [Number(point[0].substring(1,point[0].length)), Number(point[1].trim())];
                list.push(new_point);
            }else{
                var new_point = [Number(point[1].substring(2,point[1].length)), Number(point[2].trim())];
                list.push(new_point);
            }
        }
        
        return list
    }
});