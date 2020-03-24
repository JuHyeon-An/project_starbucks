package starbucks;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.DBConn;

public class Shopping_MemberDao {
	Connection conn;
	ResultSet rs;
	public Shopping_MemberDao() {
		conn = DBConn.getConn();
	}
	
	public String insert(Shopping_MemberVo vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String msg = "회원정보가 정상적으로 등록되었습니다.";
		
		try {

			
			String sql = "insert into shopping_member(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, MEMBER_EMAIL, MEMBER_REGDATE) values( ? , ? , ? , ? , ? , ? , ? )";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getmName());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getEmail());
			ps.setString(7, sdf.format(new Date()));
			
			
			int r = ps.executeUpdate();
			if(r<1) {
				msg = "입력중 오류발생";
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return msg;			
		}

	}
	
	public int login(String mId, String pwd) {
		
		String sql = "select member_id, member_pw , member_admin from shopping_member where member_id = ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			System.out.println(pwd +"비번");
			if(rs.next()) {
			
				if(rs.getString("member_pw").equals(pwd)) {
					
					if(rs.getString("member_admin") != null) {
						return 2; //관리자 로그인
					}
						
						return 1; //로그인성공
					
				}else {
					
					return 0; // 비밀번호 불일치
				}
				
			}
			return -1 ; //아이디 없음 오류
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return -2; //데이터베이스 오류
	}
	
}
