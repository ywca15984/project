var name_1 = document.getElementById('name');
var serial = document.getElementById('serial');
var email = document.getElementById('email');
var loginButton = document.getElementById('loginButton');
//DB에 데이터 송신(입력한 숫자값) 맟 DB연결 부분
function loginData(){
  var queryString = $("form[name=loginForm]").serialize() ;

       //alert("데이터 요청!> <");   //서버로부터 데이터 요청
  $.ajax({    //ajax함수 안에 객체의 형태로 실행명령을 넣는다.
       url:'LoginDB.jsp',  //가져오고자하는 서버페이지 주소를 넣는다.
       type:'post',  //데이터를 가져온다는 뜻의 get
       data: queryString,
       success : function(t){
                 //alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅
                 //alert($(t).text());  // 경고 창에 JSP파일의 내용이 떠야 한다.
                //$("<h1></h1>").text($(t).text()).appendTo("body");   //<h1>태그 적용해서 출력!
                //alert($(t).text());   //<h1>태그 적용해서 출력!)
				//window.location.href = "main.jsp";
         },
        error : function(){
        alert('연결실패');
        }
  });
}

loginButton.addEventListener('click',function()
 {	
 		if(name_1.value == "")
 		{
 			alert("이름을 입력하세요");
 			name_1.focus();
 			return;
 		}
 		else if(serial.value == "")
 		{
 			alert("시리얼 번호를 입력하세요");
 			serial.focus();
 			return;
 		}
 		else if(email.value == "")
 		{
 			alert("이메일을 입력하세요");
 			email.focus();
 			return;
 		}
 		else
 		{
 			alert("등록되었습니다.");
 			loginData();
 			location.href="login.jsp";
 		}
 
 });
