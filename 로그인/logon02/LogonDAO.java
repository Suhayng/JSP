package logon02;

import common.DBConnPool;

public class LogonDAO extends DBConnPool {

	public LogonDAO () {
		super();
	};
	
	private static LogonDAO instance = new LogonDAO();
	
	public static LogonDAO getInstance() {
		return instance;
	}
	
	
	//회원 가입 처리(registerPro.jsp)에서 넘어오는 값을 DB에 저장 (insert)
	
	public void insertMember (LogonDTO Member02) {
		
		try {
			
			String sql = "insert into member02 values (?, ?, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD')";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, Member02.getU_id());
			psmt.setString(2, Member02.getU_pass());
			psmt.setString(3, Member02.getU_name());
			psmt.setTimestamp(4, Member02.getR_date());
			psmt.setString(5, Member02.getU_address());
			psmt.setString(6, Member02.getU_tel());
			psmt.setString(7, Member02.getU_birthday());
			
			psmt.executeUpdate();
			
			System.out.println("회원정보 DB 입력 성공");
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 정보 DB 입력시 예외 발생");
		}
	}

	// 로그인 처리 (loginPro.jsp) : 폼에서 넘겨 받은 ID 와 Pass 를 DB 에서 확인 
	
	public int userCheck(String u_id, String u_pass) {
		int x = -1;	// x = -1 : 아이디가 존재하지 않음 
		
		try {
		
			String sql = "select u_pass from member02 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, u_id);
			rs =psmt.executeQuery();
			

			if (rs.next()) {    //아이디가 존재하면 
				String dbpass = rs.getString("u_pass");     //DB에서 가져온 패스워드 . 
				if (u_pass.equals(dbpass)) {
					x = 1;  // 폼에서 넘겨온 패스워드와 DB에서 가져온 패스워드가 일치 할때 x: 1 
				}else {
					x = 0;   // 패스워드가 일치하지 않을때 
				}			
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디와 패스워드 인증 실패했습니다.");
		}
		return x;
	}

	
		
	// 아이디 중복 체크(confirmId.jsp) : 아이디의 중복을 확인하는 메소드 
		
	public int confirmId02 (String u_id) {
		int x = -1;
		
		try {
			String sql = "select u_id from member02 where u_id = ?" ;
			psmt = con.prepareStatement(sql);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {	//아이디가 DB 에 존재 
				System.out.println(u_id + "는 이미 존재하는 id 입니다. ");
				x = 1;
			} else {	//아이디가 DB에 존재하지 않는 경우 
				System.out.println(u_id + "는 존재하지 않는 id 입니다.");
				x = -1;
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ID 중복 체크중 예외 발생");
		}
		return x;
	}
	

	
	
	
	
}
