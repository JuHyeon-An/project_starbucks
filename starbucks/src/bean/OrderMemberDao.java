package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import oracle.net.aso.r;

public class OrderMemberDao {

	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat();
	Shopping_MemberVo vo = new Shopping_MemberVo();
	
	public OrderMemberDao() {
		conn =  DBConn.getConn();	
	}
	
	public List<Shopping_MemberVo> select(Page page){
		List<Shopping_MemberVo> list = new ArrayList<Shopping_MemberVo>();
		String sql = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		int totList = 0;
		System.out.println("dao수정 시작점");
		sql=  " select count(member_id) cnt "
			+ " from shopping_member "
			+ " where member_id like ? "
			+ " or member_name like ? ";
		System.out.println("여기 sql문ㅇ실행가능한가..");
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			
			page.setTotListSize(totList);
			page.pageCompute();
			
			System.out.println("dao page 부분 실행될걸");
			sql = " select * from ( "
				+ " select rownum rn, A.*from( "
				+ " select 		member_id, "
				+ " 			member_pw, " 
				+ "  			member_name, "
				+ "     		member_phone, "
				+ " 			member_email, "
				+ " 			member_regdate, "
				+ "     		member_savedmoney, "
				+ "     		member_admin, "
				+ "     		member_zip, "
				+ "     		member_addr1, "
				+ "     		member_addr2  "
				+ " from shopping_member "
				+ " 	where member_id like ? "
				+ "     or member_name like ? "
				+ "     order by member_regdate)A"
				+ " )where rn between ? and ? ";
			
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() +"%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			ps.setInt(3, page.getStartNo());
			ps.setInt(4, page.getEndNo());
			
			rs =  ps.executeQuery();
			while(rs.next()) {
				
				Shopping_MemberVo vo = new Shopping_MemberVo();
				vo.setmId(rs.getString("member_id"));
				vo.setPwd(rs.getString("member_pw"));
				vo.setmName(rs.getString("member_name"));
				vo.setPhone(rs.getString("member_phone"));
				vo.setEmail(rs.getString("member_email"));
				vo.setrDate(rs.getString("member_regdate"));
				vo.setSavedMoney(Integer.parseInt(rs.getString("member_savedmoney")));
				vo.setAdmin(Integer.parseInt(rs.getString("member_admin")));
				vo.setZip(rs.getString("member_zip"));
				vo.setAddr1(rs.getString("member_addr1"));
				vo.setAddr2(rs.getString("member_addr2"));
				list.add(vo);	
				
				
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		for(Shopping_MemberVo vo:list) {
			//값 들어오지 찍어보기
			
		}
		
	return list;
		
	}
	
	
	
	
	
	
	
	
	
	public Shopping_MemberVo view(String mId) {
		Shopping_MemberVo vo = new Shopping_MemberVo();
		System.out.println("view DAo mId:" + mId);
		try {
			String sql= " select * from shopping_member where member_id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			//System.out.println("mid 값 들어오나"+memberId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo.setmId(rs.getString("member_id"));
				vo.setmName(rs.getString("member_name"));
				vo.setPhone(rs.getString("member_phone"));
				vo.setEmail(rs.getString("member_email"));
				vo.setrDate(rs.getString("member_regdate"));
				vo.setSavedMoney(rs.getInt("member_savedmoney"));
				vo.setZip(rs.getString("member_zip"));
				vo.setAddr1(rs.getString("member_addr1"));
				vo.setAddr2(rs.getString("member_addr2"));
			}
		
		}catch(Exception ex) {
			
		}finally {
		}
		return vo;
		
		
		
		
	}
	
	
	
	public String modify(Shopping_MemberVo vo) {
		System.out.println("modify dao 시작");
		String msg ="수정됐어요";
		int r = 0;
		
	
		String sql = " update shopping_member "
				   + " set member_name = ?"
				   + "	, member_phone = ?"
				   + "	, member_email = ?"
				   + "	, member_savedMoney = ?"
				   + "	, member_zip = ?"
				   + "	, member_addr1 = ?"
				   + "	, member_addr2 = ?"
				   + "where member_id = ?";
			System.out.println(" 수정 da o  o oo o o o o o o");
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, vo.getPhone());
			ps.setString(3, vo.getEmail());
			ps.setInt(4, vo.getSavedMoney());
			ps.setString(5, vo.getZip());
			ps.setString(6, vo.getAddr1());
			ps.setString(7, vo.getAddr2());
			ps.setString(8, vo.getmId());
			
			r = ps.executeUpdate(); 
			 
			System.out.println(r + "알에스 시작후 ");
			if(r<1) {
				System.out.println(r + "r값 ");
				
				throw new Exception("수정하는데 오류발새애앵");
			 
			}
			conn.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
			System.out.println(msg);
			
			return msg;
		}
	}
	
	
}
