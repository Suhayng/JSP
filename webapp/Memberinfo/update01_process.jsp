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

<%@ include file = "dbconn_oracle.jsp" %>

<%
	//form 에서 Request 객체의 getParameter 로 폼에서 넘긴 변수의 값을 받는다.
	request.setCharacterEncoding("EUC-KR");	// 한글 깨지지 않도록 처리, EUC-KR, UTF-8
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Statement stmt = null;
	ResultSet rs = null;	//select 한 결과를 담는 객체, select 한 레코드셋을 담고 있다.
	String sql = null;
	
	// 폼에서 넘겨 받은 id, passwd를 DB 에서 가져온 id, passwd 와 확인해서 같으면 UPDATE를 실행 다르면 하지 않음.
	try {
		//폼에서 받은 id를 조건으로 해서 DB의 값을 select 해본다.
		sql = "SELECT id, pass FROM mbTbl where id = '" + id + "'";  
		stmt = conn.createStatement();	//conn 의 createStatement() 를 사용해서 stmt 객체를 활성화
		
		rs = stmt.executeQuery(sql);
				//stmt.executeUpdate(sql) : insert, update, delete
				//stmt.executeQuery(sql) : select 한 결과를 resultSet 객체로 값을 반환
		
		//out.println(sql);
	} catch (Exception ex) {
		out.println (ex.getMessage());
		//out.println(sql);
	}


%>


</body>
</html>