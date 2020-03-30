package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
			
			rs = ps.executeQuery();
			
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
	
	
	public List<ShoppingCartVo> select(String mId) {
		
		List<ShoppingCartVo> list = new ArrayList<ShoppingCartVo>();
		System.out.println("mId : " + mId);
		try {
			String sql  = "SELECT i.ITEM_THUMBNAILIMG, i.ITEM_TITLE, i.ITEM_PRICE, j.itemEa, j.basket_serial " 
						+ "FROM ITEMBOARD i join SHOPPINGBASKET j " 
						+ "on i.ITEM_CODE = j.ITEM_CODE " 
						+ "where j.member_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShoppingCartVo vo = new ShoppingCartVo();
				
				vo.setmId(mId);
				vo.setFileName(rs.getString(1));
				vo.setItemTitle(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setItemEa(rs.getInt(4));
				vo.setTotPrice(rs.getInt(3)*rs.getInt(4));
				vo.setSerial(rs.getInt(5));
				list.add(vo);
				
				
			} 
			
		}catch(Exception ex) {
			ex.printStackTrace(); 
		}finally {
			return list;
		}
		
	}
	
	
	public String delete(int serial) {
		String msg = "";
		System.out.println("serial" + serial);
		try {
			String sql = "DELETE FROM SHOPPINGBASKET WHERE basket_serial=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, serial);
			
			int r = ps.executeUpdate();
			if(r>0) {
				msg = "장바구니에서 해당 상품이 삭제되었습니다.";
			}else {
				msg = "삭제중 오류가 발생했습니다.";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return msg;
		}
	}
                                                                             
}
 