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
	public List<OrderVo> select(Page page, int orderStatus) {
		List<OrderVo> list=new ArrayList<OrderVo>();
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totList = 0;
		
		
		
		//System.out.println(" dao   시자자작");
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
			if(orderStatus==0) {
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
		}else {  
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
				+ "      where  (ORDERNUMBER like ? "
			    + "      or MEMBER_ID  like ?) "
				+ " and order_status= ? "
	            + "      order by ORDER_REGDATE)A"
				+ " )where rn between ? and ? ";
	
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%" + page.getFindStr() + "%");
			pstmt.setString(2, "%" + page.getFindStr() + "%");
			pstmt.setInt(3, orderStatus);
			pstmt.setInt(4, page.getStartNo());
			pstmt.setInt(5, page.getEndNo());
		
		
		}
			rs = pstmt.executeQuery();
			while(rs.next()) {
		
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
			
			pstmt.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
//		for(OrderVo vo:list) {
//		System.out.println("여긴다오");
//		System.out.println(vo.getOrderNumber());
//		System.out.println(vo.getMemberId());
//		System.out.println(vo.getItemCode());
//		System.out.println(vo.getOrderNum());
//		System.out.println(vo.getOrderPrice());
//		System.out.println(vo.getOrderregDate());
//		System.out.println(vo.getOrderStatus());
//		}
		
		return list;
	}
	
	
	public String modify(OrderVo vo) {
	System.out.println("modify dao 시작");
	String msg ="수정됐어요";
	int r = 0;
	System.out.println(vo.orderNumber+ vo.orderStatus +"아이디랑 status");
	
	String	sql= "update shopping_order set order_status= ? "
				+ " where orderNumber = ?  ";
		
		System.out.println(" 수정 da o  o oo o o o o o o");
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, vo.getOrderStatus());
		ps.setString(2, vo.getOrderNumber());
		
		System.out.println("알에스 시작전");
		System.out.println(" status"+vo.getOrderStatus());
		System.out.println(" number" + vo.getOrderNumber());
		 
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
	
	///////////////////////////////////////////
//	public OrderVo view(String memberId) {
//		OrderVo vo = new OrderVo();
//		List<OrderVo> list = new ArrayList<OrderVo>();
//		try {
//			String sql= " select *from shopping_order where member_id=? ";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setString(1, memberId);
//			
//			//System.out.println("mid 값 들어오나"+memberId);
//			ResultSet rs = ps.executeQuery();
//			if(rs.next()) {
//				vo.setMemberId(memberId);
//			//System.out.println("view 의 아이디 들어오나");	
//			}
//		System.out.println("뷰아이디 들어오냐구");
//		
//		}catch(Exception ex) {
//			
//		}finally {
//			return vo;
//		}
//		
//		
//		
//		
//	}
	

}