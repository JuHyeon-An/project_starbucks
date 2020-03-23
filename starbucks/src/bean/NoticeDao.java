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
	public List<NoticeVo> select(String findStr) {
		List<NoticeVo> list=new ArrayList<NoticeVo>();
		String sql= " select * "
				  + " from noticeboard"
				  + " where notice_title like ?"
				  + " or notice_content like ?"
				  + " or member_name like ? ";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+findStr+"%");
			pstmt.setString(2, "%"+findStr+"%");
			pstmt.setString(3, "%"+findStr+"%");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeVo vo = new NoticeVo();
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
