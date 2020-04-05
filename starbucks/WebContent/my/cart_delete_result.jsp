<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.ShoppingCartDao"%>
<%@page import="bean.ShoppingCartVo"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Connection conn = DBConn.getConn();
	String mId = request.getParameter("mId2");
	
	int serial = Integer.parseInt(request.getParameter("delSerial"));

	
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
	}

	out.print(result);
	
	
%>