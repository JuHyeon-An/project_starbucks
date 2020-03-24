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
	
	public OrderDao() {
		conn=DBConn.getConn();
	}
	public List<OrderVo> select(String findStr) {
		List<OrderVo> list=new ArrayList<OrderVo>();
		String sql= " select * "
				  + " from shopping_order";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				OrderVo vo = new OrderVo();
				vo.setOrderNumber(rs.getString("ORDERNUMBER"));
				vo.setMemberId(rs.getString("MEMBER_ID"));
				vo.setItemCode(rs.getString("ITEM_CODE"));
				vo.setOrderNum(rs.getInt("ORDER_NUM"));
				vo.setOrderPrice(rs.getInt("ORDER_PRICE"));
				vo.setOrderregDate(rs.getString("ORDER_REGDATE"));
				vo.setOrderStatus(rs.getInt("ORDER_STATUS"));
				list.add(vo);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}