<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="css/stylesLayout.css">
</head>
<body id = "body">
		<div id = "set1">
		<div id = "image1"><img src="image/test.png" id="img"/></div>
		<div id = "set2">
          	<div id="stateSet">
          			<button id = "graph">그래프 출력</button>
		  		</div>
		  		<div id = "frame">데이터 전송중...</div>
		  		<div id = "loading"> </div>
	        	<button id="DB_Button">
	        		DB_작동/정지
	        	</button>
	        	<div id = "frame_R">데이터 분석중...</div>
		  		<div id = "loading_R"> </div>
	        	<button id="R_Button">
	        		R_작동/정지
	        	</button>
	        	<input type="text" id="count"  value= 40 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
        </div>
        </div>
      
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script type="text/javascript" src="script/main_2.js"></script>

</body>
</html>