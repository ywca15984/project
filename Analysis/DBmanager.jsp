<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
%>
<c:set var="count" value="${param.count}"/>
<%
try {
    String user = "scott";
    String pw = "tiger";
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; //IP, 포트번호랑 SID확인하기!!!
    String sql = "insert into SENSOR_DATA values(?,?,?)";
    String serialnum = "20210101AAAABB";
    %>
    <c:set var="count" value="${param.count_1}"/>
    <%
    String count = (String)pageContext.getAttribute("count");
    Class.forName("oracle.jdbc.driver.OracleDriver");        
    conn = DriverManager.getConnection(url, user, pw);
    
    //System.out.println("Database에 연결되었습니다.\n");
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(2, Integer.parseInt(count));
    pstmt.setString(1, df.format(new Date()));
    pstmt.setString(3, serialnum);
    pstmt.executeUpdate();
    conn.commit();

    pstmt.close();
    conn.close();
    
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