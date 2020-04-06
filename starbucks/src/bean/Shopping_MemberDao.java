package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Shopping_MemberDao {
	Connection conn;
	ResultSet rs;
	public Shopping_MemberDao() {
		conn = DBConn.getConn();
	}
	
	public String insert(Shopping_MemberVo vo) { //회원가입
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String msg = "회원정보가 정상적으로 등록되었습니다.";
		
		try {

			
			String sql = "insert into shopping_member(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_REGDATE, member_zip, member_addr1, member_addr2 ) "
						+ " values( ? , ? , ? , ? , ? , ? , ? , ? , ? )";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getmName());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getEmail());
			ps.setString(6, sdf.format(new Date()));
			ps.setString(7, vo.getZip());
			ps.setString(8, vo.getAddr1());
			ps.setString(9, vo.getAddr2());
			
			int r = ps.executeUpdate();
			if(r<1) {
				msg = "입력중 오류발생";
			}
	           rs.close();
	            ps.close();
	            conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return msg;			
		}

	}
	
	public int login(String mId, String pwd) { //로그인
		
		
		String sql = "select member_id, member_pw , member_admin from shopping_member where member_id = ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
			
				if(rs.getString("member_pw").equals(pwd)) {
					
					if(rs.getString("member_admin") != null) {
				           rs.close();
				            ps.close();
				            conn.close();
						return 2; //관리자 로그인
					}
			           rs.close();
			            ps.close();
			            conn.close();
						return 1; //고객 로그인성공
					
				}else {
			           rs.close();
			            ps.close();
			            conn.close();
					return 0; // 비밀번호 불일치
				}
				
			}
	           rs.close();
	            ps.close();
	            conn.close();
			return -1 ; //아이디 없음 오류
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return -2; //데이터베이스 오류
	}
	
	public int idCheck(String mId) {
		
		String sql = "select count(*) from shopping_member where member_id = ? ";
		int result = 1;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
	           rs.close();
	            ps.close();
	            conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public Shopping_MemberVo view(String mId) {
		Shopping_MemberVo vo = new Shopping_MemberVo();
		try {
			String sql  = "select member_id, member_pw, member_name, member_phone, member_zip, member_addr1, member_addr2, member_email, MEMBER_SAVEDMONEY "
					+ "from SHOPPING_MEMBER "
					+ "WHERE member_id = ? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setmId(rs.getString("member_id"));
				vo.setPwd(rs.getString("member_pw"));
				vo.setmName(rs.getString("member_name"));
				vo.setPhone(rs.getString("member_phone"));
				vo.setZip(rs.getString("member_zip"));
				vo.setAddr1(rs.getString("member_addr1"));
				vo.setAddr2(rs.getString("member_addr2"));
				vo.setEmail(rs.getString("member_email"));
				vo.setSavedMoney(rs.getInt("MEMBER_SAVEDMONEY"));
			}
			
			rs.close();
			ps.close();
			conn.close();
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return vo;
	}
	
	
	public String modify(Shopping_MemberVo vo) {
		String msg = "회원정보가 정상적으로 수정되었습니다.";
		
		try {
			String sql  = "update SHOPPING_MEMBER set MEMBER_PW=?, MEMBER_NAME=?, MEMBER_PHONE=?, MEMBER_EMAIL=?, member_zip=?, member_addr1=?, member_addr2=? "
						+ "where MEMBER_ID=?";
			conn.setAutoCommit(false);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getPwd());
			ps.setString(2, vo.getmName());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getZip());
			ps.setString(6, vo.getAddr1());
			ps.setString(7, vo.getAddr2());
			ps.setString(8, vo.getmId());
			
			
			int r = ps.executeUpdate();
			if(r>0) {
				msg = "회원정보가 정상적으로 수정되었습니다.";
				conn.commit();
			}else {
				msg = "회원정보 수정에 실패했습니다.";
				conn.rollback();
			}
			
			
		}catch(Exception ex) {
			msg = ex.toString();
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
		return msg;
		
	}
	
	
	public int deleteData(String mId, String pwd) {
		int result = 0;
		try {
			String sql = "select * from shopping_member where member_id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			rs = ps.executeQuery();
			
			
			if(rs.next()) {	
				
				if(rs.getString("member_pw").equals(pwd)) { // 입력된 정보와 일치하는 데이터가 있다면 
					sql = "delete from shopping_member where member_id=? ";
					ps = conn.prepareStatement(sql);
					ps.setString(1, mId);
					
					int r = ps.executeUpdate();
					if(r>0) {
						result = 1;	// 회원정보 삭제 성공 
						conn.commit();
					}
				}else if(!rs.getString("member_pw").equals(pwd)){
					result = -1; // 비밀번호 불일치 
				}
				
			}else {
				
			}
			 
			
		}catch(Exception ex) {
			ex.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	
		}
		return result;
	}
	
}
