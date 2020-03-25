<%@page import="bean.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String item_code = request.getParameter("item_code");
ProductDao dao = new ProductDao();
int r = dao.deleteItem(item_code);
out.print(r);
%>