package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import oracle.security.o3logon.a;

public class DaoUk_one {
	
	Connection conn;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	public DaoUk_one() {
		conn=DBConn.getConn();
	}
	public List<NoticeVo> notice_select(Page page) {
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
					   + "      order by NOTICE_REGDATE desc)A"
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
				rs.close();
				pstmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return list;
	}
	public String review_insert(ReviewVo vo) {
		String msg=null;
		String sql2=null;
		PreparedStatement pstmt2=null;
		int cnt2=0;

		try {
			String sql= " insert into REVIEWBOARD values(seq_review_postnum.nextval,?,?,?,?,?,sysdate) ";
			conn.setAutoCommit(false);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			pstmt.setString(2, vo.getItem_code());
			pstmt.setString(3, vo.getReview_title());
			pstmt.setString(4, vo.getReview_content());
			pstmt.setInt(5, vo.getReview_like());
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0) {
				sql2= " insert into review_imgs values(seq_review_postnum.currval,?,?,?,?,?) ";
				pstmt2=conn.prepareStatement(sql2);
				
				Review_imgs imgs=vo.getReview_imgs();
				List<String> list2=imgs.getSys_imgs();
				for(int i=0; i<list2.size(); i++) {
					int count=i+1;
					String para=list2.get(i);
					System.out.println(":"+count);
					pstmt2.setString(count, para);
				}
				for(int i=(list2.size()+1); i<6; i++) {
					System.out.println("::"+i);
					pstmt2.setString(i, "");
				}
				
				cnt2=pstmt2.executeUpdate();
				if(cnt2>0) {
					conn.commit();
					msg="리뷰가 등록되었습니다.";
				}else {
					conn.rollback();
					msg="사진 등록중 올가 발생하였습니다.";
				}
			
			}else {
				conn.rollback();
				msg="리뷰가 정상적으로 등록되지못했습니다.";
			}
		pstmt.close();
		conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return msg;
	}
	public List<ReviewVo> review_select(String findStr) {
		List<ReviewVo> list=new ArrayList<ReviewVo>();
		String sql= " select * from reviewboard "
				+ " where member_id like ? "
				+ " or item_code like ? "
				+ " or review_title like ? "
				+ " or review_content like ? ";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+findStr+"%");
			pstmt.setString(2, "%"+findStr+"%");
			pstmt.setString(3, "%"+findStr+"%");
			pstmt.setString(4, "%"+findStr+"%");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewVo vo=new ReviewVo();
				
				vo.setReview_postnum(rs.getInt("review_postnum"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setItem_code(rs.getString("item_code"));
				vo.setReview_title(rs.getString("review_title"));
				vo.setReview_content(rs.getString("review_content"));
				vo.setReview_like(rs.getInt("review_like"));
				vo.setReview_regdate(sdf.format(rs.getDate("review_regdate")));
				
				String sql2= " select * from review_imgs where review_postnum=? ";
				PreparedStatement pstmt2=conn.prepareStatement(sql2);
				pstmt2.setInt(1, vo.getReview_postnum());
				ResultSet rs2=pstmt2.executeQuery();
				if(rs2.next()) {
					Review_imgs imgs=new Review_imgs();
					List<String> list2=new ArrayList<String>();
					list2.add(rs2.getString("sys_img1"));
					list2.add(rs2.getString("sys_img2"));
					list2.add(rs2.getString("sys_img3"));
					list2.add(rs2.getString("sys_img4"));
					list2.add(rs2.getString("sys_img5"));
					imgs.setSys_imgs(list2);
					vo.setReview_imgs(imgs);
				}
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
