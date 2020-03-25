package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
	
	Connection conn;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	OrderVo vo = new OrderVo();
	public OrderDao() {
		conn=DBConn.getConn();
	}
	public List<OrderVo> select(Page page) {
		List<OrderVo> list=new ArrayList<OrderVo>();
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totList = 0;
		
		System.out.println(" dao   시자자작");
			  sql= " select count(ordernumber) cnt "
				  + " from shopping_order "
				  + " where ORDERNUMBER like ? "
				  + " or MEMBER_ID like ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + page.getFindStr() + "%");
			pstmt.setString(2, "%" + page.getFindStr() + "%");
			rs=pstmt.executeQuery();		
			
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			page.setTotListSize(totList);
			page.pageCompute();
			System.out.println("okdodododo");
			sql= "select * from( "
				+ " select rownum rn, A.*from( "
				+ " 	select ORDERNUMBER, "  
				+ "		MEMBER_ID, " 
				+ "	 	ITEM_CODE, "  
				+ "		ORDER_NUM, "  
				+ "		ORDER_PRICE, "  
				+ " 	ORDER_REGDATE, "  
				+ "		ORDER_STATUS "
				+ " from SHOPPING_ORDER "
				+ "      where  ORDERNUMBER like ? "
			    + "      or MEMBER_ID  like ? "
	            + "      order by ORDER_REGDATE)A"
				+ " )where rn between ? and ? ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + page.getFindStr() + "%");
			pstmt.setString(2, "%" + page.getFindStr() + "%");
			System.out.println("endno" + page.getEndNo());
			pstmt.setInt(3, page.getStartNo());
			pstmt.setInt(4, page.getEndNo());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("검색어" + page.getFindStr());
				OrderVo vo = new OrderVo();
				vo.setOrderNumber(rs.getString("ORDERNUMBER"));
				vo.setMemberId(rs.getString("MEMBER_ID"));
				vo.setItemCode(rs.getString("ITEM_CODE"));
//				vo.setMemberName(rs.getString("MEMBER_NAME"));
//				vo.setMemberPhone(rs.getString("MEMBER_PHONE"));
//				vo.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				vo.setOrderNum(rs.getInt("ORDER_NUM"));
				vo.setOrderPrice(rs.getInt("ORDER_PRICE"));
//				vo.setGetName(rs.getString("GET_NAME"));
//				vo.setGetAddress(rs.getString("GET_ADDRESS"));
				vo.setOrderregDate(rs.getString("ORDER_REGDATE"));
				vo.setOrderStatus(rs.getInt("ORDER_STATUS"));
				list.add(vo);
			
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		for(OrderVo vo:list) {
		System.out.println("여긴다오");
		System.out.println(vo.getOrderNumber());
		System.out.println(vo.getMemberId());
		System.out.println(vo.getItemCode());
		System.out.println(vo.getOrderNum());
		System.out.println(vo.getOrderPrice());
		System.out.println(vo.getOrderregDate());
		System.out.println(vo.getOrderStatus());
		}
		
		return list;
	}
	

}