<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSSQL DB Connection</title>
</head>
<body>

<%
	//변수 초기화
	Connection conn = null;		//DB 를 연결하는 객체
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost::3306/mydb";
	Boolean connect = false;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection (url, "sa", "1234");
		
		connect = true;
		conn.close();
		
	} catch (Exception e) {
		connect = false;
		e.printStackTrace();
	}
	
%>

<%
	if (connect == true ) {
		out.println("MSSQL 에 잘 연결되었습니다.");
	} else {
		out.println("MSSQL연결에 실패하였습니다.");
	}
%>
</body>
</html>