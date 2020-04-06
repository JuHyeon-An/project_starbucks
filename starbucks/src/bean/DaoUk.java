package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DaoUk {
	
	Connection conn;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String review_img="C:/Users/uk/eclipse-workspace/1907-web/WebContent/review_img/";
	
	
	public DaoUk() {
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
					   + "      order by notice_postnum desc)A"
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
				conn.commit();
			}
			rs.close();
			pstmt.close();
			conn.close();
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
			String sql= " insert into REVIEWBOARD values(seq_review_postnum.nextval,?,?,?,?,?,sysdate,0) ";
			conn.setAutoCommit(false);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			pstmt.setString(2, vo.getItem_code());
			pstmt.setString(3, vo.getReview_title());
			pstmt.setString(4, vo.getReview_content());
			pstmt.setInt(5, vo.getReview_like());
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0) {
				conn.commit();
				sql2= " insert into review_imgs values(seq_review_postnum.currval,?,?,?,?,?) ";
				pstmt2=conn.prepareStatement(sql2);
				
				if(vo.getReview_imgs()==null) {
					List<String> list=new ArrayList<String>();
					for(int i=0; i<5; i++) {
						list.add(null);
					}
					Review_imgs imgs=new Review_imgs();
					imgs.setSys_imgs(list);
					vo.setReview_imgs(imgs);
				}
				Review_imgs imgs=vo.getReview_imgs();
				List<String> list2=imgs.getSys_imgs();
				for(int i=0; i<list2.size(); i++) {
					int count=i+1;
					String para=list2.get(i);
					pstmt2.setString(count, para);
				}
				for(int i=(list2.size()+1); i<6; i++) {
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
	public List<ReviewVo> review_select(Page page) {
		List<ReviewVo> list=new ArrayList<ReviewVo>();
		String sql=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totList=0;
		/*전체 건수*/
		sql= " select count(review_postnum) cnt "
			+ " from reviewboard "
			+ " where member_id like ? "
			+ " or item_code like ? "
			+ " or review_title like ? "
			+ " or review_content like ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			pstmt.setString(4, "%"+page.getFindStr()+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totList=rs.getInt("cnt");
			}
			
			page.setTotListSize(totList);
			page.pageCompute();
			/*reviewboard*/
			sql= " select * from( "
					   + "   select rownum rn, A.*from( "
					   + "      select * "
					   + "      from reviewboard "
					   + "      where member_id like ? "
					   + "      or item_code like ? "
					   + "      or item_code like ? "
					   + "      or review_content like ? "
					   + "      order by review_regdate desc)A"
					   + " )where rn between ? and ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			pstmt.setString(4, "%"+page.getFindStr()+"%");
			pstmt.setInt(5, page.getStartNo());
			pstmt.setInt(6, page.getEndNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVo vo=new ReviewVo();
				vo.setReview_postnum(rs.getInt("review_postnum"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setItem_code(rs.getString("item_code"));
				vo.setReview_title(rs.getString("review_title"));
				vo.setReview_content(rs.getString("review_content"));
				vo.setReview_like(rs.getInt("review_like"));
				vo.setReview_regdate(sdf.format(rs.getDate("review_regdate")));
				vo.setReivew_view(rs.getInt("review_view"));
				/*reivew_imgs*/
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
				/*vo.setTotList(totList);*/
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int review_view(int review_postnum) {
		int r=0;
		String sql= " select review_view "
				  + " from reviewboard "
				  + " where review_postnum=? ";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_postnum);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int reivew_view=rs.getInt("review_view");
				reivew_view++;
				String sql2= " update reviewboard set review_view=? where review_postnum=?";
				PreparedStatement pstmt2=conn.prepareStatement(sql2);
				pstmt2.setInt(1, reivew_view);
				pstmt2.setInt(2, review_postnum);
				r=pstmt2.executeUpdate();
				pstmt.close();
				conn.commit();
			}
		conn.commit();
		rs.close();
		pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return r;
	}
	public ReviewVo review_view2(int review_postnum) {
		ReviewVo vo=new ReviewVo();
		String sql= " select * from reviewboard where review_postnum=? ";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_postnum);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setReview_postnum(rs.getInt("review_postnum"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setItem_code(rs.getString("item_code"));
				vo.setReview_title(rs.getString("review_title"));
				vo.setReview_content(rs.getString("review_content"));
				vo.setReview_like(rs.getInt("review_like"));
				vo.setReview_regdate(sdf.format(rs.getDate("review_regdate")));
				vo.setReivew_view(rs.getInt("review_view"));
				
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
				conn.commit();
			}
		rs.close();
		pstmt.close();
		conn.close();		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	public Review_imgs getImgs(int review_postnum) {
		Review_imgs imgs=new Review_imgs();
		List<String> list=new ArrayList<String>();

		try {
			String sql= " select * from review_imgs where review_postnum=? ";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, review_postnum);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				list.add(rs.getString("sys_img1"));
				list.add(rs.getString("sys_img2"));
				list.add(rs.getString("sys_img3"));
				list.add(rs.getString("sys_img4"));
				list.add(rs.getString("sys_img5"));
				imgs.setSys_imgs(list);
				conn.commit();
			}
		rs.close();
		pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imgs;
	}
	public String review_delete(int review_postnum) {
		String msg=null;
		Review_imgs imgs=getImgs(review_postnum);
		try {
			String sql2=" delete from review_imgs where review_postnum = ? ";
			PreparedStatement pstmt2=conn.prepareStatement(sql2);
			pstmt2.setInt(1, review_postnum);
			int r2=pstmt2.executeUpdate();
			if(r2>0) {
				msg=" 사진이 삭제 되었습니다. ";
				List<String> list=imgs.getSys_imgs();
				for(String img:list) {
					File file=new File(review_img+img);
					if(file.exists()) {
						file.delete();
					}
				}
				String sql=" delete from reviewboard where review_postnum = ? ";
				PreparedStatement pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, review_postnum);
				int r=pstmt.executeUpdate();
				pstmt.close();
				if(r>0) {
					msg=" 리뷰가 삭제 되었습니다. ";
					conn.commit();
				}else {
					msg=" 리뷰 삭제 도중 오류가 발생하였습니다. ";
					conn.rollback();
				}
			}else {
				msg=" 삭제중 오류가 발생했습니다. ";
				conn.rollback();
			}
			pstmt2.close();
			conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return msg;
	}
	public String review_modify(ReviewVo vo) {
		String msg=null;
		String sql= " update reviewboard "
				  + " set review_title=?, "
				  + " review_content=?, "
				  + " review_like=?, "
				  + " review_regdate=sysdate "
				  + " where review_postnum=? ";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReview_title());
			pstmt.setString(2, vo.getReview_content());
			pstmt.setInt(3, vo.getReview_like());
			pstmt.setInt(4, vo.getReview_postnum());
			int r=pstmt.executeUpdate();
			if(r>0) {
				msg=" 리뷰가 수정되었습니다. ";
				/*List<String> dbList=dbImgs.getSys_imgs();*/
				Review_imgs dbImgs=getImgs(vo.getReview_postnum());
				
				Review_imgs imgs=vo.getReview_imgs();
				List<String> olist=imgs.getSys_imgs();
				
				List<String> dlist=vo.getList();

				/*for(String dimg:dlist) {
					System.out.println("2개나와야함::"+dimg);
					int dlen=dimg.length();
					for(int i=0; i<olist.size(); i++) {
						String oimg=olist.get(i);
						System.out.println("널3개,2개:"+oimg);
						int olen=oimg.length();
						if(olen>0) {
							String str=dimg.substring(dlen-olen);
							if(oimg.equals(str)) {
								System.out.println(i);
								System.out.println(dimg);
								System.out.println("사진원래이름이랑 같아야함:"+str);
							}
						}
					}
				}*/
				
				for(int i=0; i<olist.size(); i++) {
					String oimg=olist.get(i);
					System.out.println("널3개,2개(총5번):"+oimg);
					int olen=oimg.length();
					
					if(olen>0) {
						for(String dimg:dlist) {
							System.out.println("2개나와야함(총4번):"+dimg);
							int dlen=dimg.length();
							
							String str=dimg.substring(dlen-olen);
							if(oimg.equals(str)) {
								System.out.println(i);
								System.out.println(dimg);
								System.out.println("사진원래이름이랑 같아야함(총2번):"+str);
								
								switch(i+1) {
								case 1:
									String sql1= " update review_imgs set sys_img1=? where review_postnum=? ";
									PreparedStatement pstmt1=conn.prepareStatement(sql1);
									pstmt1.setString(1, dimg);
									pstmt1.setInt(2, vo.getReview_postnum());
									int r1=pstmt1.executeUpdate();
									conn.commit();
									break;
								case 2:
									String sql2= " update review_imgs set sys_img2=? where review_postnum=? ";
									PreparedStatement pstmt2=conn.prepareStatement(sql2);
									pstmt2.setString(1, dimg);
									pstmt2.setInt(2, vo.getReview_postnum());
									int r2=pstmt2.executeUpdate();
									conn.commit();
									break;
								case 3:
									String sql3= " update review_imgs set sys_img3=? where review_postnum=? ";
									PreparedStatement pstmt3=conn.prepareStatement(sql3);
									pstmt3.setString(1, dimg);
									pstmt3.setInt(2, vo.getReview_postnum());
									int r3=pstmt3.executeUpdate();
									conn.commit();
									break;
								case 4:
									String sql4= " update review_imgs set sys_img4=? where review_postnum=? ";
									PreparedStatement pstmt4=conn.prepareStatement(sql4);
									pstmt4.setString(1, dimg);
									pstmt4.setInt(2, vo.getReview_postnum());
									int r4=pstmt4.executeUpdate();
									conn.commit();
									break;
								case 5:
									String sql5= " update review_imgs set sys_img5=? where review_postnum=? ";
									PreparedStatement pstmt5=conn.prepareStatement(sql5);
									pstmt5.setString(1, dimg);
									pstmt5.setInt(2, vo.getReview_postnum());
									int r5=pstmt5.executeUpdate();
									conn.commit();
									break;
								}
								
							}
						}
					}
				}
				
				  /*for(int i=0; i<list.size(); i++) {
					System.out.println(i);
					String img=list.get(i);
					System.out.println("1::"+img);
					for(String dateimg:datelist) {
						int datelength=dateimg.length();
						int length=img.length();
						int date=datelength-length;
						String str=dateimg.substring(date);
						System.out.println("2::"+str);
						if(img.equals(str)) {
							System.out.println("여기되냐");
						}
					}
				}*/
				
					/*String file=fileImageName.get(i);*/
					
					/*int last=file.lastIndexOf("e");
					String c=file.substring(last+1);
					switch(c) {
					case "1":
						String sql1= " update review_imgs set sys_img1=? where review_postnum=? ";
						PreparedStatement pstmt1=conn.prepareStatement(sql1);
						pstmt1.setString(1, img);
						pstmt1.setInt(2, vo.getReview_postnum());
						int r1=pstmt1.executeUpdate();
						conn.commit();
						if(dbList.get(0)!=null) {
							String dbImg1=dbList.get(0);
							File filef1=new File(review_img+dbImg1);
							if(filef1.exists()) {
								filef1.delete();
							}
						}
						break;
					case "2":
						String sql2= " update review_imgs set sys_img2=? where review_postnum=? ";
						PreparedStatement pstmt2=conn.prepareStatement(sql2);
						pstmt2.setString(1, img);
						pstmt2.setInt(2, vo.getReview_postnum());
						int r2=pstmt2.executeUpdate();
						conn.commit();
						if(dbList.get(1)!=null) {
							String dbImg2=dbList.get(1);
							File filef2=new File(review_img+dbImg2);
							if(filef2.exists()) {
								filef2.delete();
							}
						}
						break;
					case "3":
						String sql3= " update review_imgs set sys_img3=? where review_postnum=? ";
						PreparedStatement pstmt3=conn.prepareStatement(sql3);
						pstmt3.setString(1, img);
						pstmt3.setInt(2, vo.getReview_postnum());
						int r3=pstmt3.executeUpdate();
						conn.commit();
						if(dbList.get(2)!=null) {
							String dbImg3=dbList.get(2);
							File filef3=new File(review_img+dbImg3);
							if(filef3.exists()) {
								filef3.delete();
							}
						}
						break;
					case "4":
						String sql4= " update review_imgs set sys_img4=? where review_postnum=? ";
						PreparedStatement pstmt4=conn.prepareStatement(sql4);
						pstmt4.setString(1, img);
						pstmt4.setInt(2, vo.getReview_postnum());
						int r4=pstmt4.executeUpdate();
						conn.commit();
						if(dbList.get(3)!=null) {
							String dbImg4=dbList.get(3);
							File filef4=new File(review_img+dbImg4);
							if(filef4.exists()) {
								filef4.delete();
							}
						}
						break;
					case "5":
						String sql5= " update review_imgs set sys_img5=? where review_postnum=? ";
						PreparedStatement pstmt5=conn.prepareStatement(sql5);
						pstmt5.setString(1, img);
						pstmt5.setInt(2, vo.getReview_postnum());
						int r5=pstmt5.executeUpdate();
						conn.commit();
						if(dbList.get(4)!=null) {
							String dbImg5=dbList.get(4);
							File filef5=new File(review_img+dbImg5);
							if(filef5.exists()) {
								filef5.delete();
							}
						}
						break;
					}*/
				
			}else {
				msg=" 리뷰 수정 도중 오류가 발생하였습니다. ";
				conn.rollback();
			}
		pstmt.close();
		conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	public List<ReviewVo> review_select(Page_Item page) { // 아이템 상세보기 페이지 셀렉트 메소드 -영덕
		List<ReviewVo> list=new ArrayList<ReviewVo>();
		String sql=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totList=0;
		/*전체 건수*/
		sql= " select count(review_postnum) cnt "
			+ " from reviewboard "
			+ " where member_id like ? "
			+ " or item_code like ? "
			+ " or review_title like ? "
			+ " or review_content like ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			pstmt.setString(4, "%"+page.getFindStr()+"%");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totList=rs.getInt("cnt");
			}
			
			page.setTotListSize(totList);
			page.pageCompute();
			
			/*reviewboard*/
			sql= " select * from( "
					   + "   select rownum rn, A.*from( "
					   + "      select * "
					   + "      from reviewboard "
					   + "      where member_id like ? "
					   + "      or item_code like ? "
					   + "      or item_code like ? "
					   + "      or review_content like ? "
					   + "      order by review_regdate desc)A"
					   + " )where rn between ? and ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+page.getFindStr()+"%");
			pstmt.setString(2, "%"+page.getFindStr()+"%");
			pstmt.setString(3, "%"+page.getFindStr()+"%");
			pstmt.setString(4, "%"+page.getFindStr()+"%");
			pstmt.setInt(5, page.getStartNo());
			pstmt.setInt(6, page.getEndNo());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewVo vo=new ReviewVo();
				vo.setReview_postnum(rs.getInt("review_postnum"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setItem_code(rs.getString("item_code"));
				vo.setReview_title(rs.getString("review_title"));
				vo.setReview_content(rs.getString("review_content"));
				vo.setReview_like(rs.getInt("review_like"));
				vo.setReview_regdate(sdf.format(rs.getDate("review_regdate")));
				vo.setReivew_view(rs.getInt("review_view"));
				
				/*reivew_imgs*/
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
