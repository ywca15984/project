<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.io.*" %>
<%@page import ="java.awt.Image,java.awt.image.BufferedImage" %>
<%@page import ="java.net.URL" %>
<%@page import ="javax.imageio.ImageIO" %>
<%@page import = "org.rosuda.REngine.*"%>
<%@page import = "org.rosuda.REngine.REXPMismatchException"%>
<%@page import = "org.rosuda.REngine.Rserve.RConnection"%>
<%@page import = "org.rosuda.REngine.Rserve.RserveException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	RConnection connection = null;
	REXP x =null;
	byte x_1[] = null;
	
    /* Create a connection to Rserve instance running
     * IP Addr, UserID, Password required 
     */
    
    connection = new RConnection();
    connection.eval("setwd(\"C:/eclipse/workspace/prototype1/src/main/webapp/image\")");
    /*connection.eval("x<-c(1,2,3,4)");
    connection.eval("y<-c(1,2,3,4)");
    
    connection.eval("jpeg(filename=\"myplot.jpeg\",width=600,height=300,unit=\"px\",bg=\"transparent\")");
    connection.eval("plot(x,y,main = \"my plot\")");
    connection.eval("dev.off()");  */
    

	//파일 객체 생성
	File evalFile = new File("C:/Users/rnjst/Desktop/test.txt");
	//입력 스트림 생성
	FileReader filereader = new FileReader(evalFile);
	//입력 버퍼 생성
	BufferedReader bufReader = new BufferedReader(filereader);
	String line = "";
	while((line = bufReader.readLine()) != null){
		
		//out.print(line);
		//out.print("what:"+line+"\n");
		connection.eval(line);
	}//.readLine()은 끝에 개행문자를 읽지 않는다.   
	bufReader.close();
	
    
	/* File file = new File(filePath+"/image/2.png"); 
	BufferedImage bi = ImageIO.read(file);
	//자바 1.4 ImageIO를 이용한 이미지 저장 
	File file1 = new File(filePath+"/image/test2.png"); 
	ImageIO.write(bi, "png", file1); 
	File file2 = new File(filePath+"/image/test2.jpg"); 
	ImageIO.write(bi, "jpg", file2); */
	connection.close();
	//자바 1.4 ImageIO를 이용한 이미지 로딩
	
%>

</body>
</html>