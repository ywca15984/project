<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
DataSource ds = null;
Connection con = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
final String DATASOUCE="projectdb";
%>
<% 
%>
	<c:set var="name" value="${param.name}"/>
	<c:set var="serial" value="${param.serial}"/>
	<c:set var="email" value="${param.email}"/>
<%
String name = (String)pageContext.getAttribute("name");
String email = (String)pageContext.getAttribute("email");
String serial = (String)pageContext.getAttribute("serial");
out.write("name="+name+"  email="+email);
%>
<%
try {
	InitialContext ic = new InitialContext();
	ds = (DataSource)ic.lookup(DATASOUCE);
	con = ds.getConnection();
    String sql = "insert into CLIINFO values(?,?,?)";
    int a = 0;
    %>
    <c:set var="count" value="${param.count_1}"/>
    <% 
    //System.out.println("Database에 연결되었습니다.\n");
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, serial);
    pstmt.setString(2, name);
    pstmt.setString(3, email);
    pstmt.executeUpdate();
    con.commit();

    pstmt.close();
    con.close();
    
} catch (ClassNotFoundException cnfe) {
    System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
} catch (SQLException sqle) {
    System.out.println("DB 접속실패 : "+sqle.toString());
} catch (Exception e) {
    System.out.println("Unkonwn error");
    e.printStackTrace();
}
%>
</body>
</html>