package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NoticeDao {
	Connection conn;
	ResultSet rs;
	
	public NoticeDao() {
		conn = DBConn.getConn();
	}
	
	public String insert(NoticeVo vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String msg = "공지사항이 정상적으로 입력되었습니답!!";
		try {
			String sql = "select member_name from shopping_member where member_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMemberId());
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setMemberName(rs.getString(1));
				System.out.println("vo.getMemberName() : "+vo.getMemberName());
			}
			sql = "insert into noticeboard(NOTICE_POSTNUM, MEMBER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_REGDATE, NOTICE_VIEWS, MEMBER_NAME) "
					+ " values( NOTICE_POSTNUM_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMemberId());
			ps.setString(2, vo.getNoticeTitle());
			ps.setString(3, vo.getNoticeContent());
			ps.setString(4, sdf.format(new Date()));
			ps.setInt(5, 0);
			ps.setString(6, vo.getMemberName());
			int r = ps.executeUpdate();
			if(r<1) {
				msg = "입력중 오류발생";
			}
			ps.close();
			rs.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return msg;
		}
	}
}