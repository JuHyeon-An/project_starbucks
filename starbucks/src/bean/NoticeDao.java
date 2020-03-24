package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
	
	Connection conn;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	public NoticeDao() {
		conn=DBConn.getConn();
	}
	public List<NoticeVo> select(Page page) {
		List<NoticeVo> list=new ArrayList<NoticeVo>();
		String sql=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totList=0;
		/*전체건수*/
		
		sql= " select count(notice_title) cnt "
		   + " from noticeboard "
		   + " where notice_title like ? "
		   + " or notice_content like ? "
		   + " or member_name like ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totList=rs.getInt("cnt");
			}
			
			page.setTotListSize(totList);
			page.pageCompute();
			
			sql= " select * from( "
					   + "   select rownum rn, A.*from( "
					   + "      select NOTICE_POSTNUM, "
					   + "			   MEMBER_ID, "
					   + "			   NOTICE_TITLE, "
					   + "			   NOTICE_CONTENT, "
					   + "			   to_char(NOTICE_REGDATE, 'rrrr-MM-dd') NOTICE_REGDATE, "
					   + "			   NOTICE_VIEWS, "
					   + "			   MEMBER_NAME "
					   + "      from NOTICEBOARD"
					   + "      where notice_title like ? "
					   + "      or notice_content like ? "
					   + "      or member_name like ? "
					   + "      order by NOTICE_REGDATE)A"
					   + " )where rn between ? and ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			pstmt.setInt(4, page.getStartNo());
			pstmt.setInt(5, page.getEndNo());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeVo vo=new NoticeVo();
				vo.setNoticePostNum(rs.getInt("notice_postNum"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setNoticeTitle(rs.getString("notice_title"));
				vo.setNoticeContent(rs.getString("notice_content"));
				vo.setNoticeRegDate(sdf.format(rs.getDate("notice_regDate")));
				vo.setNoticeView(rs.getInt("notice_views"));
				vo.setMemberName(rs.getString("member_name"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
