<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MySQL DB Connection</title>
</head>
<body>

<%
	//변수 초기화
	Connection conn = null;		//DB 를 연결하는 객체
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB";
	Boolean connect = false;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection (url, "root", "1234");
		
		connect = true;
		conn.close();
		
	} catch (Exception e) {
		connect = false;
		e.printStackTrace();
	}
	
%>

<%
	if (connect == true ) {
		out.println("MySQL 에 잘 연결되었습니다.");
	} else {
		out.println("MySQL연결에 실패하였습니다.");
	}
%>
</body>
</html>