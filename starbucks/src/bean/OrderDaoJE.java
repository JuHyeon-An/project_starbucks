package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
 
public class OrderDaoJE {	
	Connection conn;
	ResultSet rs;
	
	public OrderDaoJE() {
		conn = DBConn.getConn();
	}
	
	public int insert(List<OrderVo> list) {
		int result = 0;
		for(OrderVo vo:list) {
			try {
				String sql = "insert into SHOPPING_ORDER"
							+ "(ORDERNUMBER, MEMBER_ID, ITEM_CODE, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, ORDER_NUM, ORDER_PRICE, "
							+ "GET_NAME, GET_PHONE, ORDER_REGDATE, ORDER_STATUS, MEMBER_ZIP, MEMBER_ADDR1, MEMBER_ADDR2, SERIAL) "
							+ "values(order_orderNum_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, order_serial_seq.nextval)";
				PreparedStatement ps = conn.prepareStatement(sql);
				conn.setAutoCommit(false);
			
				ps.setString(1, vo.getMemberId());
				ps.setString(2, vo.getItemCode());
				ps.setString(3, vo.getMemberName());
				ps.setString(4, vo.getMemberPhone());
				ps.setString(5, vo.getMemberEmail());
				ps.setInt(6, vo.getOrderNum());	// ea
				ps.setInt(7, vo.getOrderPrice());
				ps.setString(8, vo.getGetName());
				ps.setString(9, vo.getGetPhone());
				ps.setString(10, vo.getOrderregDate());
				ps.setInt(11, vo.getOrderStatus());
				ps.setString(12, vo.getZone());
				ps.setString(13, vo.getAddr1());
				ps.setString(14, vo.getAddr2()); 
				
				list.add(vo);
				
				int r = ps.executeUpdate();
				
				if(r>0) {
					result = 1;
					conn.commit();
				}else {
					conn.rollback();
				}
				
				
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				return result;
			}
		}
		return result;
		
	}
	
	public OrderVo view(String mId) {
		OrderVo vo = new OrderVo();
		try {
			String sql  = "SELECT member_name, member_phone, member_zip, member_addr1, member_addr2, member_email, member_savedMoney "
					+ "from SHOPPING_MEMBER " 
					+ "where member_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setMemberName(rs.getString(1));
				vo.setMemberPhone(rs.getString(2));
				vo.setZone(rs.getString(3));
				vo.setAddr1(rs.getString(4));
				vo.setAddr2(rs.getString(5));
				vo.setMemberEmail(rs.getString(6));
				vo.setSavedMoney(rs.getInt(7));
				vo.setMemberId(mId);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public List<OrderVo> select(String mId){
		
		List<OrderVo> list = new ArrayList<OrderVo>();
		try {
			String sql  = "SELECT to_char(o.order_regdate, 'rrrr-MM-dd') order_regdate, i.item_thumbnailImg, i.item_title, o.order_price, o.order_num, o.order_status, o.item_code, i.item_price " 
						+ "FROM SHOPPING_ORDER o join ITEMBOARD i " 
						+ "ON o.item_code = i.item_code " 
						+ "WHERE o.member_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderVo vo = new OrderVo();
				
				vo.setOrderregDate(rs.getString(1));
				vo.setProductImg(rs.getString(2));
				vo.setItemTitle(rs.getString(3));
				vo.setOrderPrice(rs.getInt(4));
				vo.setOrderNum(rs.getInt(5));
				vo.setOrderStatus(rs.getInt(6));
				vo.setItemCode(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
