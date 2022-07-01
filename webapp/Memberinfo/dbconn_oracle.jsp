<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//변수 초기화
	Connection conn = null;		//DB 를 연결하는 객체
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Boolean connect = false;
	
	Class.forName(driver);
	conn = DriverManager.getConnection (url, "hr", "hr");
		

%>

</body>
</html>