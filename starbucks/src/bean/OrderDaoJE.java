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
		String sql = "";
		int size = list.size();
		
		for(int i=0; i<size; i++) {
			OrderVo vo = list.get(i);
			
			try {
				if(i==0) {
					sql = "insert into SHOPPING_ORDER"
							+ "(ORDERNUMBER, MEMBER_ID, ITEM_CODE, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, ORDER_NUM, ORDER_PRICE, "
							+ "GET_NAME, GET_PHONE, ORDER_REGDATE, ORDER_STATUS, MEMBER_ZIP, MEMBER_ADDR1, MEMBER_ADDR2, SERIAL) "
							+ "values(order_orderNum_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, order_serial_seq.nextval)";
					
				}else {
					sql = "insert into SHOPPING_ORDER"
							+ "(ORDERNUMBER, MEMBER_ID, ITEM_CODE, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, ORDER_NUM, ORDER_PRICE, "
							+ "GET_NAME, GET_PHONE, ORDER_REGDATE, ORDER_STATUS, MEMBER_ZIP, MEMBER_ADDR1, MEMBER_ADDR2, SERIAL) "
							+ "values(order_orderNum_seq.currval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, order_serial_seq.nextval)";
				}
				
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
	
	public List<OrderVo> select(String mId, Page page, String status){
		
		List<OrderVo> list = new ArrayList<OrderVo>();
		String sql = "";
		PreparedStatement ps = null;
		
		int totList = 0;
		int orderStatus = 0;
		try {
			if(status.equals("0")) {	// 전체 주문 목록 
				//전체 주문 건수 구하기 
				sql = "SELECT COUNT(ordernumber) cnt FROM SHOPPING_ORDER WHERE MEMBER_ID=?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, mId);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					totList = rs.getInt("cnt");
				}
				page.setTotListSize(totList);
				page.pageCompute();
				
				sql = "select * from ("
						+ "		select rownum rn, A.* from("
						+ " 		SELECT to_char(o.order_regdate, 'rrrr-MM-dd') order_regdate, i.item_thumbnailImg, i.item_title, o.order_price, o.order_num, o.order_status, o.item_code, i.item_price, o.serial "
						+ "				FROM SHOPPING_ORDER o join ITEMBOARD i "
						+ "				ON o.item_code = i.item_code "
						+ "				WHERE o.member_id=? "
						+ "				order by o.serial desc) A "
						+ "	) where rn between ? and ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				ps.setInt(2, page.getStartNo());
				ps.setInt(3, page.getEndNo());
			}else {
				if(status.equals("1")) { // 주문상태 = 1 (주문취소)
					orderStatus = 1;
				}else if(status.equals("2")) { // 주문상태 = 2 (승인대기)
					orderStatus = 2;
				}else if(status.equals("3")) { // 주문상태 = 3 (주문완료 )
					orderStatus = 3;
				}
				
				
				//전체 주문 건수 구하기 
				sql = "SELECT COUNT(ordernumber) cnt FROM SHOPPING_ORDER WHERE MEMBER_ID=? and order_status=?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, mId);
				ps.setInt(2, orderStatus);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					totList = rs.getInt("cnt");
				}
				page.setTotListSize(totList);
				page.pageCompute();
				
				sql = "select * from ("
						+ "		select rownum rn, A.* from("
						+ " 		SELECT to_char(o.order_regdate, 'rrrr-MM-dd') order_regdate, i.item_thumbnailImg, i.item_title, o.order_price, o.order_num, o.order_status, o.item_code, i.item_price, o.serial "
						+ "				FROM SHOPPING_ORDER o join ITEMBOARD i "
						+ "				ON o.item_code = i.item_code "
						+ "				WHERE o.member_id=? "
						+ "				and order_status=? "
						+ "				order by o.serial desc) A "
						+ "	) where rn between ? and ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				ps.setInt(2, orderStatus);
				ps.setInt(3, page.getStartNo());
				ps.setInt(4, page.getEndNo());
			
			}
			
		
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderVo vo = new OrderVo();
				
				vo.setOrderregDate(rs.getString("order_regdate"));
				vo.setProductImg(rs.getString("item_thumbnailImg"));
				vo.setItemTitle(rs.getString("item_title"));
				vo.setOrderPrice(rs.getInt("order_price"));
				vo.setOrderNum(rs.getInt("order_num"));
				vo.setOrderStatus(rs.getInt("order_status"));
				vo.setItemCode(rs.getString("item_code"));
				vo.setPrice(rs.getInt("item_price"));
				vo.setSerial(rs.getInt("serial"));
				
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return list;
	}
}
