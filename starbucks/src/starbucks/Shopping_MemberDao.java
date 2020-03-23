package starbucks;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import bean.DBConn;
import starbucks.MemberVo;

public class Shopping_MemberDao {
	Connection conn;
	
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
	
}
