var count = document.getElementById('count');
var img = document.getElementById('img');
var DB_Button = document.getElementById('DB_Button');
var graph = document.getElementById('graph');
var R_Button = document.getElementById('R_Button');
var check1 = 0;
var check2 = 0;
var timer_DB;
var timer_R;


function func_DB(){
		let sendData = "count_1="+$(count).val(); 
    	$.ajax({    //ajax함수 안에 객체의 형태로 실행명령을 넣는다.
         			url:'DBmanager.jsp',  //가져오고자하는 서버페이지 주소를 넣는다.
         			type:'get',  //데이터를 가져온다는 뜻의 get
         			data: sendData,
         			success : function(t){
                  								
           								 },
          			error : function(){
          										alert('연결실패');
          							   }					   			
 });
}


function func_image(){
  var date = new Date();
  $("#img").attr("src", "image/plot1.jpeg?"+date.getTime());
}

function func_R(){
	 $.ajax({    //ajax함수 안에 객체의 형태로 실행명령을 넣는다.
       url:'index1.jsp',  //가져오고자하는 서버페이지 주소를 넣는다.
       type:'post',  //데이터를 가져온다는 뜻의 get
       success : function(t){
       		$('#loading_R').css('background','transparent');
      		$('#loading_R').css('animation-play-state','paused');
      		$('#frame_R').css('color','transparent');
                
         },
        error : function(){
          //alert('연결실패');
        }
  });
}

function func_R_reculsive(){  
	  $('#loading_R').css('background',' linear-gradient( 180deg,#4CC417 5%, #FFEBEE)');
      $('#loading_R').css('animation-play-state','running');
      $('#frame_R').css('color','black');
      func_R();
      timer_R = setTimeout(func_R_reculsive,20000)
}


 function func_DB_reculsive(){  
      func_DB();
      timer_DB = setTimeout(func_DB_reculsive,5000);
      }
      
function func_stop_DB(){
       clearTimeout(timer_DB);
 }
 
 function func_stop_R(){
       clearTimeout(timer_R);
 }

DB_Button.addEventListener('click',function()
 {
	 if(check1 ==0){
	  setTimeout(func_DB_reculsive,100);
      $('#loading').css('background',' linear-gradient( 180deg,#FF80AB 5%, #FFEBEE)');
      $('#loading').css('animation-play-state','running');
      $('#frame').css('color','black');
      check1 = 1;
    }
    else if(check1 == 1){
      func_stop_DB();
      $('#loading').css('background','transparent');
      $('#loading').css('animation-play-state','paused');
      $('#frame').css('color','transparent');
      check1 = 0;
    }
	});
	
R_Button.addEventListener('click',function()
 {
	 if(check2 ==0){
	  setTimeout(func_R_reculsive,100);
      $('#loading_R').css('background',' linear-gradient( 180deg,#4CC417 5%, #FFEBEE)');
      $('#loading_R').css('animation-play-state','running');
      $('#frame_R').css('color','black');
      check2 = 1;
    }
    else if(check2 == 1){
      func_stop_R();
      $('#loading_R').css('background','transparent');
      $('#loading_R').css('animation-play-state','paused');
      $('#frame_R').css('color','transparent');
      check2 = 0;
    }
	});
	
graph.addEventListener('click',function()
 {
	func_image();
 });
	

