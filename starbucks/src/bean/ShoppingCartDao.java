package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShoppingCartDao {
	Connection conn;
	ResultSet rs;
	
	public ShoppingCartDao() {
		conn = DBConn.getConn();
	}
	
	public int insert(ShoppingCartVo vo, String mId) {
		int result = 0;	
		System.out.println("sadsda");
		try {
			String sql = "select * from shoppingBasket where member_id=? and item_code=?";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, vo.getItemCode());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return 0;
			}else {
				sql = "insert into shoppingBasket values(cart_serial_seq.nextval ,?,?,?)";
				
				
				ps = conn.prepareStatement(sql);
				
				System.out.println("ps after");
				
				ps.setString(1, vo.getmId());
				ps.setInt(2, vo.getItemEa());
				ps.setString(3, vo.getItemCode());
				
				System.out.println("getItemEa : " +  vo.getItemEa());
				
				int r = ps.executeUpdate();
				
				if(r>0) {
					result = 1;	// 장바구니 담기 성공
					conn.commit();
				}else {
					conn.rollback();
					
				}
			}
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return 0;
		}
		
		return result;
	}
}
 