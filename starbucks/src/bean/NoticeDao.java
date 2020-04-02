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
	
	public int insert(NoticeVo vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String msg = "공지사항이 정상적으로 입력되었습니답!!";
		int r=0;
		try {
			
			String sql = "insert into noticeboard(NOTICE_POSTNUM, MEMBER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_REGDATE, NOTICE_VIEWS, MEMBER_NAME) "
					+ " values( NOTICE_POSTNUM_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMemberId());
			System.out.println("dao memberId : "+vo.getMemberId());
			ps.setString(2, vo.getNoticeTitle());
			System.out.println(vo.getNoticeTitle());
			ps.setString(3, vo.getNoticeContent());
			System.out.println(vo.getNoticeContent());
			ps.setString(4, sdf.format(new Date()));
			ps.setInt(5, 0);
			ps.setString(6, "관리자");
			
			r = ps.executeUpdate();
			System.out.println("결과 r : "+r);
			
			if(r<1) {
				msg = "입력중 오류발생";
				conn.commit();
			}
			
			ps.close();

		}catch(Exception e) {
			e.printStackTrace();
			conn.rollback();
		}finally {
			return r;
		}
	}
}