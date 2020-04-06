package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NoticeDao {
	Connection conn;
	ResultSet rs;

	public NoticeDao() {
		conn = DBConn.getConn();
	}

	public int insert(NoticeVo vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String msg = "공지사항이 정상적으로 입력되었습니답!!";
		int r = 0;
		try {

			String sql = "insert into noticeboard(NOTICE_POSTNUM, MEMBER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_REGDATE, NOTICE_VIEWS, MEMBER_NAME) "
					+ " values( NOTICE_POSTNUM_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMemberId());
			System.out.println("dao memberId : " + vo.getMemberId());
			ps.setString(2, vo.getNoticeTitle());
			System.out.println(vo.getNoticeTitle());
			ps.setString(3, vo.getNoticeContent());
			System.out.println(vo.getNoticeContent());
			ps.setString(4, sdf.format(new Date()));
			ps.setInt(5, 0);
			ps.setString(6, "관리자");

			r = ps.executeUpdate();
			System.out.println("결과 r : " + r);

			if (r < 1) {
				msg = "입력중 오류발생";
				conn.commit();
			}

			ps.close();

		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			return r;
		}
	}

	public int modify(NoticeVo vo) {
		System.out.println("modify dao 시자아아아아ㅏ앙ㄱ");
		System.out.println("1 : "+vo.getMemberId());
		System.out.println("2 : "+vo.getNoticeContent());
		System.out.println("3 : "+vo.getNoticeTitle());
		System.out.println("4 : "+vo.getNoticePostNum());
		
		System.out.println("notice modifyy dao 시작");
		String msg = "수정완료오!";
		int r = 0;

		String sql = " update noticeboard " 
				+ " set notice_title = ?" 
				+ " ,notice_content = ?"
				+ " where notice_postnum = ?";

		System.out.println(" 수정 da o  o oo o o o o o o");
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getNoticeTitle());
			ps.setString(2, vo.getNoticeContent());
			ps.setInt(3, vo.getNoticePostNum());

			r = ps.executeUpdate();

			System.out.println(r + "알에스 시작후 ");
			if (r < 1) {
				System.out.println(r + "r값 ");
				throw new Exception("수정하는데 오류발새애앵");

			}
			conn.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			System.out.println(msg);
			return r;
		}
	}

	// 조회수 증가
	public int updateViewCount(int noticePostNum) {
		int result = 0;
		try {
		String sql = "update noticeboard set notice_views=notice_views+1 "
					+ " where notice_postnum = ? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, noticePostNum);
				
				result = ps.executeUpdate();
				if(result<1) {
					conn.commit();
				}
				
				ps.close();

			}catch(Exception e){
				e.printStackTrace();
				conn.rollback();
			}finally{
		return result;
	}

}

	
	public int delete(int noticePostNum) {
		int r=0;
		try {
			String sql = " delete from noticeboard "
						+ " where notice_postnum = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, noticePostNum);
			
			r = ps.executeUpdate();
			if(r<1) {
				conn.commit();
			}
			
			ps.close();
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return r;
		}
	}
	
	public NoticeVo view(int noticePostNum) {
		NoticeVo vo = new NoticeVo();
		
		try {
			String sql = " select * from noticeboard where notice_postnum = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, noticePostNum);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo.setMemberId(rs.getString("member_id"));
				vo.setNoticeTitle(rs.getString("notice_title"));
				vo.setNoticeContent(rs.getString("notice_content"));
				vo.setNoticeRegDate(rs.getString("notice_regdate"));
				vo.setNoticeView(rs.getInt("notice_views"));
				vo.setNoticePostNum(rs.getInt("notice_postnum"));
			}
			
			conn.commit();

			ps.close();
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
}