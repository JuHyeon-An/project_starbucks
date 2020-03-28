package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
		
		sql=  " select count(ordernumber) cnt "
			+ " from shopping_member "
			+ " where member_id like ? "
			+ " or member_name like ? ";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.findStr + "%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			
			page.setTotListSize(totList);
			page.pageCompute();
			
			sql = "select * from ( "
				+ " select rownum rn, A.*from( "
				+ " select member_id, "
				+ " 	member_pw, "
				+ "  	member_name, "
				+ "     member_phone, "
				+ " 	member_email, "
				+ " 	member_regdate, "
				+ "     member_savedmoney, "
				+ "     member_admin, "
				+ "     member_zip, "
				+ "     member_addr1, "
				+ "     member_addr2  "
				+ " from shopping_member "
				+ " 	where member_id like ? "
				+ "     or member_name like ? "
				+ " )where rn btween ? and ? ";
			
			
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
