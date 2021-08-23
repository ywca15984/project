<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body class = "body">
<form name="loginForm" id="loginForm">
<h1 class = "team">PROJECT</h1>

<div class = "name_div">
	<input type="text" name="name" id = "name" placeholder="name"/>
</div>

<div class = "serial_div">
	<input type="text" name="serial" id = "serial" placeholder="serial_num"/>
</div>

<div class = "email_div">
	<input type="text" name="email" id = "email" placeholder="email(example@mail.com)"/>
</div>
<div>
<button type ="button" id="loginButton">REGISTRATION</button>
</div>
</form>





<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script type="text/javascript" src="script/login.js"></script>
</body>
</html>