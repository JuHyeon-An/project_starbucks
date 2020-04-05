<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.ShoppingCartDao"%>
<%@page import="bean.ShoppingCartVo"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConn.getConn();

	String mId = request.getParameter("mId");
	String fileName = request.getParameter("fileName");
	String itemCode = request.getParameter("item_code");
	
	int price = 0;
	int itemEa = 0;
	int totPrice = 0;
	
	
	if(request.getParameter("oriPrice") != null && request.getParameter("itemEaVal") != null && request.getParameter("totPrice") != null){
		price = Integer.parseInt(request.getParameter("oriPrice"));
		itemEa = Integer.parseInt(request.getParameter("itemEaVal"));
		
		totPrice = Integer.parseInt(request.getParameter("totPrice"));
		
	}
	
	ShoppingCartVo vo = new ShoppingCartVo(mId, fileName, itemCode, price, itemEa, totPrice);
	

	int result = 0;	
	String sql = null;
	PreparedStatement ps = null;
	try {
		// member_name 값 세팅하기 
		sql = "SELECT member_name from SHOPPING_MEMBER where member_id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, mId);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			vo.setmName(rs.getString(1));
		}
		
		// 해당 아이디, 아이템 코드가 일치하는 데이터가 있는지 확인 (중복값 제거)
		sql = "select * from shoppingBasket where member_id=? and item_code=?";
		
		conn.setAutoCommit(false);
		ps = conn.prepareStatement(sql);
		ps.setString(1, mId);
		ps.setString(2, vo.getItemCode());
		
		rs = ps.executeQuery();
		
		if(rs.next()) {
			result = 0;
		}else {
			sql = "insert into shoppingBasket(basket_serial, member_id, itemEa, item_code, member_name) values(cart_serial_seq.nextval ,?,?,?,?)";
			
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mId);
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
		result = 0;
	}

	
	out.print(result);
	
%>