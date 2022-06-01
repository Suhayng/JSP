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
	request.setCharacterEncoding("EUC-KR");	// 한글 깨지지 않도록 처리, EUC-KR, UTF-8
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Statement stmt = null;
	ResultSet rs = null;	//select 한 결과를 담는 객체, select 한 레코드셋을 담고 있다.
	String sql = null;
	
	try {
		// 레코드 삭제, 폼에서 넘긴 ID, Passwd 와 DB 의 ID와 Passwd가 일치할 때 레코드 제거, id (primary key)
		
		sql = "SELECT id, pass FROM mbTbl WHERE id = '" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) { // ID가 존재할 때
			// rs의 결과 레코드를 변수에 할당
			String rId = rs.getString("id");
			String rPass = rs.getString("pass");
			
			// 패스워드가 일치하는지 확인
			if (passwd.equals(rPass)){	//폼에 password와 DB의 Password 가 일치할 때
				sql = "delete mbTbl where id = '" + id + "'";
				stmt.executeUpdate(sql);	
				
				out.println("테이블에서 해당 아이디 : " + id + " 가 삭제되었습니다.");
			
				//out.println(sql);	
			}else {	// 폼의 password 와 DB 의 Password 가 일치하지 않을 때
				out.println ("패스워드가 일치하지 않습니다.");
			}
			
		} else { // ID 가 존재하지 않을 때	
			out.println ("해당 아이디가 존재하지 않습니다.");
		}
		
		//out.println(sql);
		
	} catch (Exception ex) {
		out.println(ex.getMessage());
		
	} finally {
		if(rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	
	
	

%>

</body>
</html>