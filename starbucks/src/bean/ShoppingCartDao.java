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
		String sql = null;
		PreparedStatement ps = null;
		try {
			// member_name 값 세팅하기 
			sql = "SELECT s.member_name " 
				+ "from SHOPPING_MEMBER s join SHOPPINGBASKET c " 
				+ "on s.member_id = c.member_id " 
				+ "where c.member_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setmName(rs.getString(1));
				
				System.out.println("vo.getName ------ 쇼팡카트 insert " + vo.getmName());
			}
			
			
			// 해당 아이디, 아이템 코드가 일치하는 데이터가 있는지 확인 (중복값 제거)
			sql = "select * from shoppingBasket where member_id=? and item_code=?";
			
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, vo.getItemCode());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return 0;
			}else {
				sql = "insert into shoppingBasket values(cart_serial_seq.nextval ,?,?,?,?)";
				
				
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, vo.getmId());
				ps.setInt(2, vo.getItemEa());
				ps.setString(3, vo.getItemCode());
				ps.setString(4, vo.getmName());
				
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
		try {
			String sql  = "SELECT i.ITEM_THUMBNAILIMG, i.ITEM_TITLE, i.ITEM_PRICE, j.itemEa, j.basket_serial, j.member_name, i.item_code  " 
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
				vo.setmName(rs.getString(6));
				vo.setItemCode(rs.getString(7));
				
				list.add(vo);
				
				
			} 
			
		}catch(Exception ex) {
			ex.printStackTrace(); 
		}finally {
			return list;
		}
		
	}
	
	
	public int delete(int serial) {
		int result = 0;
		
		try {
			String sql = "DELETE FROM SHOPPINGBASKET WHERE basket_serial=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, serial);
			
			int r = ps.executeUpdate();
			if(r>0) {
				result = 1;
			}else {
				result = 0;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return result;
		}
	}
                                                                             
}
 