package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmailDao {
	Connection conn;
	ResultSet rs;

	public EmailDao() {
		conn = DBConn.getConn();
	}

	public Shopping_MemberVo idFind(String mName, String email) { // 아이디찾기

		String sql = "select member_name, member_email, member_id from shopping_member where member_name = ? and member_email = ? ";
		Shopping_MemberVo  vo = new Shopping_MemberVo();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mName);
			ps.setString(2, email);
			rs = ps.executeQuery();

			if (rs.next()) {

				if (rs.getString("member_name").equals(mName) && rs.getString("member_email").equals(email)) {
					vo.setmName(mName);
					vo.setEmail(email);
					vo.setmId(rs.getString("member_id"));
					rs.close();
					ps.close();
					conn.close();
					return vo; // 아이디 이메일 일치

				}
			}
			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo; // 데이터베이스 오류
	}
	public Shopping_MemberVo pwFind(String mName, String mId, String email) { // 아이디찾기

		String sql = "select member_name, member_email, member_id, member_pw from shopping_member where member_id = ? and member_email = ? and member_name = ? ";
		Shopping_MemberVo  vo = new Shopping_MemberVo();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, email);
			ps.setString(3, mName);
			rs = ps.executeQuery();

			if (rs.next()) {

				if (rs.getString("member_id").equals(mId) && rs.getString("member_email").equals(email)) {
					vo.setmName(rs.getString("member_name"));
					vo.setEmail(email);
					vo.setmId(rs.getString("member_id"));
					vo.setPwd(rs.getString("member_pw"));
					rs.close();
					ps.close();
					conn.close();
					return vo; // 아이디 이메일 일치

				}
			}
			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo; // 데이터베이스 오류
	}

}
